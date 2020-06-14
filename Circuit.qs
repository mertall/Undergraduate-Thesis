// Written By Mridul Sarkar
// 6/6/20 2:43 AM
namespace QMSA {
c

    operation Algorithm(N : Double, y : 'T[] ) : Result[] {
        let q = ApplytoEach(H,Intialize(N));
        let e = ApplytoEach(w[y],w); // Verify this is Unitary
        let r = ApplytoAll(S_0(N),e); 
        let t = ApplytoEach(H,r); // Update this with new T gate, after finding proper inverse
        let result = ApplytoAll(S_0(N,y),t);

        let result = Measure(u[0]);

        return result;
    }

    operation Initialize(N : Double, y : 'T[]) : 'U {
        // encode integers BigEndian('T[])
        using (qubits=Qubit[N]) {
            
            mutable qubits = PrepareUniform(qubits);
        }
            return qubits;
    }


    // https://quantumcomputing.stackexchange.com/questions/12301/how-can-i-code-a-conditional-phase-shift-transform
    operation S_A(qubits : 'T[], N : Double, y : Int ): Unit is Adj + Ctl {
        using (ubit = Qubit()) {
            within {
                H(ubit);
                Z(ubit);
            } apply {
                for ((idx,element) in qubits) {
                    (ControlledOnInt(element, X))(qubits[y], ubit); // Third positional arugment does not sit right with me
                }
            }
        }
        return qubits;
}

    operation S_0(qubits : 'T[], N : Double) : Unit is Adj + Ctl {

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

