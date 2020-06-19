// Written By Mridul Sarkar
// 6/16/20 14:18AM

// Reformat this with better variable names
namespace QMSA {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Arrays; 
    open Microsoft.Quantum.Preparation as p;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Math as mt;

    newtype LittleEndian = Qubit[];

    operation Algorithm_Even(truncated_length_E : Int, table_length_E : Int, random_index_E : Int, encoded_table_E : Double[] ) : Result 
    {
        let q_bitz = Intialize(truncated_length_E, table_length_E, random_index_E, encoded_table_E);
        Microsoft.Quantum.Arrays.ApplyToEach(H,q_bitz); 
        Microsoft.Quantum.Arrays.ApplyToAll(CNOT,q_bitz); 
        Microsoft.Quantum.Arrays.ApplyToEach(H,q_bitz);
        Microsoft.Quantum.Arrays.ApplyToAll(S_0, q_bitz);

        return DumpMachine(q_bitz);

    }

    operation Algorithm_Odd(truncated_length_O : Int, table_length_O : Int, random_index_O : Int, encoded_table_O : Double[] ) : Result 
    {
        let q_bits = Intialize(truncated_length_O, table_length_O, random_index_O, encoded_table_O);

        Microsoft.Quantum.Arrays.ApplyToAll(QFT,q_bits); 
        Microsoft.Quantum.Arrays.ApplyToAll(CNOT,q_bits); 
        Microsoft.Quantum.Arrays.ApplyToAll(QFT,q_bits);
        Microsoft.Quantum.Arrays.ApplyToAll(S_0, q_bits);

        return DumpMachine(q_bits);

    }

    //https://quantumcomputing.stackexchange.com/questions/12471/how-do-i-encode-integers-into-bigendian-in-q/12472#12472
    operation Initialize(k : Int, N : Int, r : Int, t : Double[]) : 'T[]  
    {

        using (qubits=Qubit[k]) 
        {
            PrepareUniformSuperposition(k, qubits);
            ApplyToEach(qubits,qubits[r]);
            ApplyToAll(qubits,1/sqrt(N-k));
        return qubits;
        }
    }


    operation S_0( input_1 : 'T[] ) : 'T[]
    {

        using(ubit_1=Qubit()) 
        {
            within
            {
                let f = ubit_1;
            } 
            apply 
            {
                for ((idx,element) in input_1) 
                {
                    if (ubit_1 == element) {
                        ApplyToEach(negative(),input_1);
                    }
                }
            }
        } 
        return input_1;
    }
    
}
