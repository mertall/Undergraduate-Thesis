// Written By Mridul Sarkar
// 6/13/20 10:12 PM
namespace QMSA {


    operation Algorithm(N : Double, y : Int, t : 'T[] ) : Result[] {
        let a=Intialize(N,t);
        let q = ApplytoEach(H,a); // if odd number of entries must use fourier
        let e = ApplytoEach(q[y],q); // Verify this is Unitary
        let r = ApplytoAll(S_A,e[1..N-1]); 
        let t = ApplytoEach(H,r); // if odd number of entries...
        let result = ApplytoAll(S_0,t[1..N-1]);

        let result = Measure(u[0]);

        return result;
    }

    operation Initialize(N : Double, t : 'T[]) : 'U {
        // encode integers BigEndian('T[])
        using (qubits=Qubit[N]) {
            
            mutable qubits = PrepareUniform(qubits);
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

