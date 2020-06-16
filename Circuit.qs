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

    operation Algorithm_Even(truncated_length_E : Int, table_length_E : Int, random_index_E : Int, encoded_table_E : Double[] ) : Qubit[] 
    {
        let oracle_E = p.Intialize(truncated_length_E, table_length_E, random_index_E, encoded_table_E);
        let first_gate_E = Microsoft.Quantum.Arrays.ApplytoEach(H,oracle_E); 
        let second_gate_E = Microsoft.Quantum.Arrays.ApplytoAll(S_A,first_gate_E); 
        let inverse_first_gate_E = Microsoft.Quantum.Arrays.ApplytoEach(H,second_gate_E);
        
        let result_E = Microsoft.Quantum.Arrays.ApplytoAll(S_0, inverse_first_gate_E);

        let ans_E = DumpMachine(result_E);

        return ans_E;
    }

    operation Algorithm_Odd(truncated_length_O : Int, table_length_O : Int, random_index_O : Int, encoded_table_O : Double[] ) : Qubit[] 
    {
        let q_bits = Intialize(truncated_length_O, table_length_O, random_index_O, encoded_table_O);

        Microsoft.Quantum.Arrays.ApplytoAll(QFT,q_bits); 
        Microsoft.Quantum.Arrays.ApplytoAll(S_A,q_bits); 
        Microsoft.Quantum.Arrays.ApplytoAll(QFT,q_bits);
        
        let result_O = Microsoft.Quantum.Arrays.ApplytoAll(S_0, inverse_first_gate_O);

        let ans_O = DumpMachine(result_O);

        return ans_O;
    }

    //https://quantumcomputing.stackexchange.com/questions/12471/how-do-i-encode-integers-into-bigendian-in-q/12472#12472
    operation Initialize(k : Int, N : Int, r : Int, t : Double[]) : Qubit[]  
    {

        using (qubits=Qubit[k]) 
        {
            PrepareUniformSuperposition(k, qubits);
            ApplytoEach(qubits,qubits[r]);
            ApplytoAll(qubits,1/sqrt(N-k));
        return qubits;
        }
    }


    // https://quantumcomputing.stackexchange.com/questions/12301/how-can-i-code-a-conditional-phase-shift-transform
    operation S_A(input : LittleEndian): Unit[]
    {
        using (ubit = Qubit()) 
        {
            LittleEndianasBigEndian(input);
            within 
            {
                H(ubit);
                Z(ubit);
            } 
            apply 
            {
                for ( (idx,element) in input ) 
                {
                    (ControlledOnInt(element, X))(input!, ubit);
                }
            }
            BigEndianasLittleEndian(input);
        }
}

    operation S_0( input_1 : LittleEndian ) : Unit[]
    {

        using(ubit_1=Qubit()) 
        {
            LittleEndianasBigEndian(input_1);
            within
            {
                let f = ubit_1;
            } 
            apply 
            {
                for ((idx,element) in input_1) 
                {
                    if (ubit_1 == element) {
                        ApplytoElement(negative(),idx,input_1);
                    }
                }
            }
            BigEndianasLittleEndian(input_1);
        } 
    }
}
