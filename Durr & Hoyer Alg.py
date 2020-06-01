from pennylane import numpy as np
import qsharp
import pennylane as qml
class Durr_Hoyer:
    def ___init___(self,table):
        self.table = np.ndarray.flatten(table)
        self.N = np.size(table)
        self.y = np.random.uniform(0,self.N-1)
        self.states = 0

    def circut(self,wire_num):
            for num in range(self.wire_num):
                if table[num]<table[y]:
                    qml.BasisState(n=states[num] ,wires=num)
                    return
                else:
                    self.table.pop(num)
                    self.wire_num = self.wire_num - 1
                    continue
            basis = 1/np.sqrt(N) .* np.ones(self.wire_num)
            basis = expval(qml.Identity(y)) .* basis
            qml.broadcast(basis,wires=range(self.wire_num))
            #index=Grovers Alg
            return index
    dev1 = qml.device("default.qubit",wires=self.N)
    def algorithmI(self,N,y):
        while (time.clock()<(22.5*sqrt(N)+1.4*log(N)^2)):
            y_prime=circuit(self.N)
            if table(y_prime) < table(self.y):
                return y_prime
            else:
                return self.y
        return self.y