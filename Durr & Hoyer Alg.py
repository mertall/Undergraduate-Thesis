from pennylane import numpy as np
import qsharp
import pennylane as qml
import Grovers as gr
#https://arxiv.org/pdf/quant-ph/9605034.pdf / https://arxiv.org/pdf/quant-ph/9607014.pdf
# Only works for 4 element table
class Durr_Hoyer:
    def ___init___(self,table):
        self.table = np.ndarray.flatten(table)
        self.m,self.n = np.size(table)
        self.N = self.m*self.n
        self.y = np.random.uniform(0,self.N-1)
        self.states = [[10],[01],[11],[00]]
        dev1 = qml.device("default.qubit",wires=self.N)

        @qml.qnode(dev1)
    def create_states(self,N)
        #
    def compare(self,s,t)
        return sorted(self.s) >= self.t
    def circuit(self,wire_num):
            marked=compare(table,table[y])
            self.states = self.states - (marked .* self.states)
            qml.BasisState(n=self.states,wires=self.wire_num)
            basis = 1/np.sqrt(N) .* np.ones(self.wire_num)
            basis = qml.expval(qml.Identity(y)) .* basis
            qml.broadcast(basis,wires=range(self.wire_num))
            qubits = qml.Identity(range(N))
            grovers = gr.calculate(qubits,self.wire_num)
            return qml.expval(qml.Identity(0))

    def algorithm(self,N,y):
        while (time.clock()<(22.5*sqrt(self.N)+1.4*log(self.N)^2)):
            y_prime=circuit(self.N)
            if table(y_prime) < table(self.y):
                return y_prime
            else:
                return self.y
        return self.y