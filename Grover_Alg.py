import pennylane as qml
from pennylane import numpy as np 
#https://arxiv.org/pdf/quant-ph/9605034.pdf
class Grovers:
    def ___init___(self,qubit,N)
        self.qubit=qubit
        self.N=N
    def S(self,qubit,N):
        if qubit >= range(self.N):
            self.qubit = -self.qubit
        else 
            self.qubit = self.qubit
        return self.qubit


    def T_t(self,qubit,N)

        #self.qubit=1/sqrt(N)sum(i...N-1)|i\*transpose(|0\)
        reutrn self.qubit

    def calculate(self,qubit,N)
        return T_t(self.qubit,self.N))*S(self.qubit,0)*1/T_t(self.qubit.self.N)*S(self.qubit,self.N)