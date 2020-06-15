// Written By Mridul Sarkar
// 6/13/20 10:12 PM
open Microsoft.Quantum.Diagnostics;
open Microsoft.Quantum.Arrays;
open Microsoft.Quantum.Convert;

namespace QMSA {


    operation Algorithm_Even(j : Int, N : Double, y : Int, f : 'T[] ) : Result[] {
        let q = Intialize(j, N, f);
        let u = ApplytoEach(1/sqrt(N),q);
        let b = ApplytoEach(H,u[1..N-1]); 
        let i = ApplytoEach(q[y],b); 
        let t = ApplytoAll(S_A,i); 
        let z = ApplytoEach(H,t[1..N-1]);
        let result = ApplytoAll(S_0,z[1..N-1]);

        let result = Measure(u[0]);

        return result;
    }

        operation Algorithm_Odd(j : Int, N : Double, y : Int, f : 'T[] ) : Result[] {
        let q = Intialize(j, N, f);
        let u = ApplytoEach(1/sqrt(N),q);
        let b = ApproximateQFT(j,u[1..N-1]); 
        let i = ApplytoEach(q[y],b); 
        let t = ApplytoAll(S_A,i[1..N-1]); 
        let z = ApproximateQFT(j,t[1..N-1]); 
        let result = ApplytoAll(S_0,z[1..N-1]);

        let result = Measure(u[0]);

        return result;
    }
    //https://quantumcomputing.stackexchange.com/questions/12471/how-do-i-encode-integers-into-bigendian-in-q/12472#12472
    operation Initialize(j : Int, N : Int, t : 'T[]) : BigEndian {

        using (qubits=Qubit[N]) {
            mutable qubits = PrepareArbitraryState(t, qubits);
            let qubits = LittleEndianAsBigEndian(qubits);
        }
            return qubits;
    }


    // https://quantumcomputing.stackexchange.com/questions/12301/how-can-i-code-a-conditional-phase-shift-transform
    operation S_A(qubits : BigEndian): Unit is Adj + Ctl {
        using (ubit = Qubit()) {
            within {
                H(ubit);
                Z(ubit);
            } apply {
                for ( idx in qubits ) {
                    (ControlledOnInt(element, X))(qubits!, ubit);
                }
            }
        }
        return qubits;
}

    operation S_0(qubits : BigEndian) : Unit is Adj + Ctl {

        using(ubit=Qubit()) {
            within{
                let f = ubit;
            } apply {
                for ((idx,element) in qubits) {
                    if (ubits == element) {
                        ApplytoElement(negative(),idx,qubits);
                    }
                }
        }
        return qubits;
        } 
    }
}