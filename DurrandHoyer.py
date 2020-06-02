from pennylane import numpy as np
from pennylane import QNode
import pennylane as qml
import time
import numpy as npp
from Circuit import quantum_alg
#import Grovers as gr

#https://arxiv.org/pdf/quant-ph/9605034.pdf / https://arxiv.org/pdf/quant-ph/9607014.pdf
class DH(object):
    def __init__(self,table):
        self.table = npp.ndarray.flatten(table)                  #Vectorize table
        self.N= len(self.table)
        self.y = int(npp.random.uniform(0,self.N-1))                #Threshold Index
        
    
    def compare(self,s,t):
        return sorted(s) > (t * npp.ones(self.N))
    
    def algorithm(self):
        N = self.N
        y = self.y
        t = self.table
        index=[]
        markers=[]
        while (time.clock()<(22.5*npp.sqrt(N)+1.4*npp.log(N)**2)):      #Run until time stated by paper
            
            markers=self.compare(t,t[y])                    #Compare T[j]<T[y] for all j in N
            
            t = t - (t * markers)                                       #Hot enconde all values of the table that were greater than T[y] as 0

            index = [i for i in t if t[i] != 0]                    #Remove all values that are zero and record indices that are non-zero

            self.wire_num = len(index)
            quantum_alg(self.wire_num,self.N,self.y)
            circuit = QNode(quantum_alg,dev)
            y_prime=circuit(N, y, t, self.wire_num)               #Evaluate Quantum circuit to find y_prime
            
            if self.table(index(y_prime)) < self.table(self.y):
                return index(y_prime)                                      #Return index for minimum (Probability of success: 1/2)
            else:                                                          #...
                return y                                              #...
        
        return y                                                      #...

