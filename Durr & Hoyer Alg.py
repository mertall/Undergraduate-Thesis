from pennylane import numpy as np
import qsharp
import pennylane as qml
import Grovers as gr
#https://arxiv.org/pdf/quant-ph/9605034.pdf / https://arxiv.org/pdf/quant-ph/9607014.pdf
class Durr_Hoyer:
    def ___init___(self,table):
        self.table = np.ndarray.flatten(table)
        self.N = np.size(table)
        self.y = np.random.uniform(0,self.N-1)
        self.states = 0
        dev1 = qml.device("default.qubit",wires=self.N)

        @qml.qnode(dev1)
    def circuit(self,wire_num):
            for num in range(self.wire_num):
                if table[num]<table[y]:
                    qml.BasisState(n=states[num] ,wires=num)
                    return
                else:
                    self.table.pop(num)
                    self.wire_num = self.wire_num - 1
                    continue
            basis = 1/np.sqrt(N) .* np.ones(self.wire_num)
            basis = qml.expval(qml.Identity(y)) .* basis
            qml.broadcast(basis,wires=range(self.wire_num))
            qubits = qml.Identity(range(N))
            grovers = gr.calculate(qubits,self.wire_num)
            return qml.expval(qml.Identity(0))

    def algorithm(self,N,y):
        while (time.clock()<(22.5*sqrt(N)+1.4*log(N)^2)):
            y_prime=circuit(self.N)
            if table(y_prime) < table(self.y):
                return y_prime
            else:
                return self.y
        return self.y