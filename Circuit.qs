// Written By Mridul Sarkar
// 6/13/20 10:12 PM
open Microsoft.Quantum.Diagnostics;
open Microsoft.Quantum.Arrays;
open Microsoft.Quantum.Convert;

namespace QMSA {
<<<<<<< HEAD
=======

>>>>>>> 4dae863740d30ca5ed9d96ca6a34728113cee86e


    operation Algorithm_Even(j : Int, N : Double, y : Int, t : 'T[] ) : Result[] {
        let a=Intialize(j, N, t);
        let z = ApplytoEach(1/sqrt(N),a);
        let q = ApplytoEach(H,z[1..N-1]); 
        let e = ApplytoEach(q[y],q); 
        let r = ApplytoAll(S_A,e); 
        let t = ApplytoEach(H,r[1..N-1]);
        let result = ApplytoAll(S_0,t[1..N-1]);

        let result = Measure(u[0]);

        return result;
    }

        operation Algorithm_Odd(j : Int, N : Double, y : Int, t : 'T[] ) : Result[] {
        let a=Intialize(j, N, t);
        let z = ApplytoEach(1/sqrt(N),a);
        let q = ApproximateQFT(j,z[1..N-1]); 
        let e = ApplytoEach(q[y],q); 
        let r = ApplytoAll(S_A,e[1..N-1]); 
        let t = ApproximateQFT(j,r[1..N-1]); 
        let result = ApplytoAll(S_0,t[1..N-1]);

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

    function Sqrt(N : Double) : Double {let ans = sqrt(N);return ans;}

    function Div(a : Double, b : Double) : Double {let ans = a/b; return ans;}

}

