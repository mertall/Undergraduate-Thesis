import pennylane as qml
from pennylane import numpy as np 
#https://arxiv.org/pdf/quant-ph/9605034.pdf
class Grovers:
    def ___init___(self,qubits,N)
        self.qubits=qubits
        self.N=N
    def S(self,qubit,N): #Conditional Phase Shift Transform
        if self.qubits is in list((range(2^N*10^N) % N)):
            self.qubits = -self.qubits
        else 
            self.qubits = self.qubits
        return self.qubits


    def T_t(self,qubits,N) #Transpose of Walsh-Hadamard transform

        #self.qubit=1/sqrt(N)sum(i...N-1)|i\*transpose(|0\)
        reutrn self.qubits

    def calculate(self,qubits,N)
        return T_t(self.qubits,self.N))*S(self.qubits,0)*1/T_t(self.qubits.self.N)*S(self.qubits,self.N)