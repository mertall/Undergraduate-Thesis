namespace QMSA {
    open Micrsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Measurement;

    operation Algorithm(qubits : Qubit) : Result[] {

        let q = ApplytoEach(H,Intialize(N));
        let w = ApplytoEach(Oracle,q);
        let e = ApplytoEach(T_t,w)
        let r = ApplytoEach(S_0,e)
        let t = ApplytoEach(T_T,r)
        let u = ApplytoEach(S_A,t)

        let result = M(u[0]);

        return result;
    }
    
    operation Initialize(N : Double) : Qubit {
        using (qubits=Qubit[N]) {
            PrepareUniform(qubits);
            }
            return qubits;
        }
    operation Oracle(qubits: Qubit[], N : Double, y : Int ) : Unit {
        let x = Sqrt(N);
        let w = Div(1,x);
        let z = ApplytoEach(w,qubits);
        let v = ApplytoEach(qubits[y],z);
        return v;
    }
    function Sqrt(N : Double) : Double {let ans = sqrt(N);return ans;}
    function Div(a : Double, b : Double) : Double {let ans = a/b; return ans;}
    operation T_t(qubits: Qubit[], N : Double) {
        let x = Sqrt(N);
        let d = Div(1,x);
        let i = ApplytoEach(i,qubits[0..1..N-1]);
        
        using (qbit = Qubit()) {
            let o = ApplytoEach(o,qbit)
        }
        return o;
    }
    operation S_0{
        ///Not Sure tbh lol
    }
    operation S_A{
        ///Again Not Sure lmao
    }
}
