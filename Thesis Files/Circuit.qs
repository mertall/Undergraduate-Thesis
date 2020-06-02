/// Written By Mridul Sarkar
/// 6/2/20 10:16 AM
namespace QMSA {
    open Micrsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;

    operation Algorithm(N : Double, y : Int) : Result[] {

        let q = ApplytoEach(H,Intialize(N));
        let w = ApplytoAll(Oracle(N,y),q);
        let e = ApplytoAll(T_t(N),w);
        let r = ApplytoAll(S_0,e);
        let t = ApplytoAll(T_T(N),r);
        let u = ApplytoAll(S_A(N),t);

        let result = M(u[0]);

        return result;
    }
    
    operation Initialize(N : Double) : 'U {
        using (qubits=Qubit[N]) {
            PrepareUniform(qubits);
        }
            return qubits;
    }

    operation Oracle(qubits: 'T[], N : Double, y : Int ) : 'U {
        let x = Sqrt(N);
        let w = Div(1,x);
        let z = ApplytoEach(w,qubits);
        let v = ApplytoEach(qubits[y],z);
        return v;
    }

    operation T_t(qubits: 'T[], N : Double) : 'U {
        let x = Sqrt(N);
        let d = Div(1,x);
        let i = ApplytoEach(i,qubits[0..1..N-1]);
        let o = ApplytoEach(i,[1,0]);
        return o;
    }

    operation S_0(qubits : 'T[], N : Double) : 'U {

        using(ubits=Qubit[1]) {
            let f = NullSpaceMap(negative,ubits,qubits);
            
        }
        return f;
    }

    operation S_A(qubits : 'T[]) : 'U {

        
    }

    operation T_T(qubits: 'T[], N : Double) : 'U {
        let x = Sqrt(N);
        let d = Div(x,1);
        let i = ApplytoEach(d,qubits[0..1..N-1]);
        let e = ApplytoEach(i,-[1,0]);
        return e;
    }

    function Sqrt(N : Double) : Double {let ans = sqrt(N);return ans;}

    function Div(a : Double, b : Double) : Double {let ans = a/b; return ans;}

    function negative( qubits : 'T[]) : 'U {
        let v = -1* qubits;
        return v;
    }

    function NullSpaceMap(mapper : ((Int, 'T[]) -> 'U), ubits : 'T[], qubits : 'T[]) : 'U {
        for ((idx,element) in Enumerated(qubits)) {
            if (ubits == element) {
                ApplytoElement(negative(),idx,qubits);
            }
        }
        return qubits;
    }

}
