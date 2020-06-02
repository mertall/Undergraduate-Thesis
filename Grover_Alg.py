import pennylane as qml
from pennylane import numpy as np 
#https://arxiv.org/pdf/quant-ph/9605034.pdf
def Grovers():
    ##Quantum Node
    def S(self,qubits,N):                                    #Conditional Phase Shift Transform
        if self.qubits[,:] in (list((range(2^N*10^N) % N)):
            self.qubits = -self.qubits
        
        else: 
            self.qubits = self.qubits
        
        return self.qubits

    ##Quantum Node
    def T_t(self,qubits,N):                                  #Transpose of Walsh-Hadamard transform

        #self.qubit=1/sqrt(N)sum(i...N-1)|i\*transpose(|0\)
        reutrn self.qubits
    #calling seperate nodes together
    def calculate(self,qubits,N)                            #Grovers Algorithm
        
        return T_t(self.qubits,self.N))*S(self.qubits,0)*1/T_t(self.qubits.self.N)*S(self.qubits,self.N)