from pennylane import numpy as np
import qsharp
import pennylane as qml
import Grovers as gr
#https://arxiv.org/pdf/quant-ph/9605034.pdf / https://arxiv.org/pdf/quant-ph/9607014.pdf
# Only works for 4 element table
class Durr_Hoyer:
    def ___init___(self,table):
        self.table = np.ndarray.flatten(table)                  #Vectorize table
        n = len(self.table)                                     #Grab dimensions
        self.N = n - 1                                          #...
        self.y = np.random.uniform(0,self.N-1)                  #Threshold Index

    def compare(self,s,t,N)
        return sorted(self.s) > (self.t .* np.ones(self.N))

    def circuit(self,N,y,wire_num):

            wire=self.wire_num
            N = self.N
            y= self.y

            qml.broadcast(hadmard,range(wire))                  #Create a unique set of qubits based on wire number
            
            basis = 1/np.sqrt(N) .* np.ones(wire)               #Modify Basis as mentioned in paper
            basis = qml.expval(qml.Identity(self.y)) .* basis   #...
            qml.broadcast(basis,wires=range(wire))              #...
            
            qubits = qml.Identity(range(wire))                  #Grab state of qubits for Grovers
            
            grovers = gr.calculate(qubits,wire)                 #Apply Grovers
            
            return qml.expval(qml.Identity(0))                  #Grab first register as stated by paper

    def algorithm(self,N,y,table):

        while (time.clock()<(22.5*sqrt(self.N)+1.4*log(self.N)^2)):      #Run until time stated by paper
            
            t=self.table
            index =[]

            markers=compare(self.table,self.table[y],self.N)                    #Compare T[j]<T[y] for all j in N
            
            self.wire_num = len(markers)                                 #Wires for qubits based on compare()
            
            t = t - (t .* markers)                                       #Hot enconde all values of the table that were greater than T[y] as 0

            t,index= [t[i],i for i in t if t[i] != 0]                    #Remove all values that are zero and record indices that are non-zero
            
            dev = qml.device("default.qubit",wires=self.wire_num)        #Set up quantum device and run circuit
            @qml.qnode(dev)
            y_prime=circuit(self.N,self.y,t,self.wire_num)               #Evaluate Quantum circuit to find y_prime
            
            if self.table(index(y_prime)) < self.table(self.y):
                return index(y_prime)                                      #Return index for minimum (Probability of success: 1/2)
            else:                                                          #...
                return self.y                                              #...
        
        return self.y                                                      #...