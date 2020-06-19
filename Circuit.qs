// Written By Mridul Sarkar
// 6/19/20 11:50AM

namespace QMSA {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Arrays; 
    open Microsoft.Quantum.Preparation as p;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Math as mt;

    operation Algorithm_Even(q_bitz : Qubit[] ) : Result 
    {
        Microsoft.Quantum.Arrays.ApplyToEach(H,q_bitz); 
        Microsoft.Quantum.Arrays.ApplyToAll(CNOT,q_bitz); 
        Microsoft.Quantum.Arrays.ApplyToEach(H,q_bitz);
        Microsoft.Quantum.Arrays.ApplyToAll(S_0, q_bitz);

        return DumpMachine(q_bitz);

    }

    operation Algorithm_Odd(q_bits : Qubit[]) : Result 
    {

        Microsoft.Quantum.Arrays.ApplyToAll(QFT,q_bits); 
        Microsoft.Quantum.Arrays.ApplyToAll(CNOT,q_bits); 
        Microsoft.Quantum.Arrays.ApplyToAll(QFT,q_bits);
        Microsoft.Quantum.Arrays.ApplyToAll(S_0, q_bits);

        return DumpMachine(q_bits);

    }

//operation ApplyConditionalPhase(subset : Int[], register : LittleEndian)
//: Unit is Adj + Ctl {
    //using (aux = Qubit()) {
        //within {
            // prepare aux in the |−⟩ state. 
            //H(aux);
            //Z(aux);
        //} apply {
            //for (element in subset) {
                //(ControlledOnInt(element, X))(register!, aux);
            //}
        //}
    //}
//}

    operation S_0( input_1 : Qubit[] ) : Qubit[]
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
    
    operation Controlled_Not(input_1 : Qubit[]) : Qubit[]
    {
        ApplyToAll(CNOT,input_1);
        Measure(input_1);
    }
}
