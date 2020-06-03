/// Written By Mridul Sarkar
/// 6/2/20 11:44PM
namespace QMSA {
    open Micrsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;

    operation Algorithm(N : Double, y : Int) : Result[] {
        let q = ApplytoEach(H,Intialize(N));
        let w = ApplytoAll(Oracle(N,y),q);
        let e = ApplytoE(T_t(N),w);
        let r = ApplytoAll(S_0(N),e);
        let t = ApplytoAll(T_T(N),r);
        let u = ApplytoAll(S_A(N),t);

        let result = MeasureInteger(u[0]);

        return result;
    }

    operation Initialize(N : Double) : 'U {
        using (qubits=Qubit[N]) {
            
            mutable qubits = PrepareUniform(qubits);
        }
            return qubits;
    }

    operation Oracle(qubits: 'T[], N : Double, y : Int ) : Unit is Adj + Ctl {
        within{
            let x = Sqrt(N);
            let w = Div(1,x);
        } apply {
            ApplytoEach(w,qubits);
            ApplytoEach(qubits[y],z);
        }
        return qubits;
    }

    operation T_t(qubits: 'T[], N : Double) : Unit is Adj + Ctl {
        within{
            let x = Sqrt(N);
            let d = Div(1,x);
        } apply {
            ApplytoEach(i,qubits[0..1..N-1]);
            ApplytoEach(i,[1,0]);
        }
        return qubits;
    }

    // https://quantumcomputing.stackexchange.com/questions/12301/how-can-i-code-a-conditional-phase-shift-transform
    operation S_A(qubits : 'T[], N : Double): Unit is Adj + Ctl {
    using (ubit = Qubit()) {
        within {
            H(ubit);
            Z(ubit);
        } apply {
            for ((idx,element) in qubits) {
                (ControlledOnInt(element, X))(element, ubit); // Third positional arugment does not sit right with me
            }
        }
    }
}

    operation S_0(qubits : 'T[], N : Double) : 'U {

        using(ubit=Qubit[1]) {
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

