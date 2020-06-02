# Circuit.py>
import pennylane as qml
from pennylane import numpy as np
import numpy as npp
from pennylane import broadcast,Hadamard,dot
def quantum_alg(wire_num,N,y):
    r = range(wire_num)
    #broadcast(Hadamard(wires=1),wire_num,"single")                  #Create a unique set of qubits based on wire number
        
    basis = 1/npp.sqrt(N) * npp.ones(wire_num)               #Modify Basis as mentioned in paper
    basis = dot(qml.Identity(y), basis)  #...
    broadcast(basis,r,"single")              #...
            
    #qubits = qml.Identity(range(wire))                  #Grab state of qubits for Grovers
            
    #grovers = gr.calculate(qubits,wire)                 #Apply Grovers
            
    return qml.expval(qml.Identity(0))                  #Grab first register as stated by paper
    dev = qml.device('default.qubit',wires=wire_num)


