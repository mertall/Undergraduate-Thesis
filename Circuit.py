# Circuit.py>
import pennylane as qml
from pennylane import numpy as np
import numpy as npp
from pennylane import broadcast,Hadamard,dot
def quantum_alg(wire_num,N,y):
    r = range(wire_num)
    ###Qnode 1
    broadcast(Hadamard(wires=1),wire_num,"single")                 
    ###Qnode 2
    basis = 1/npp.sqrt(N) * npp.ones(wire_num)
    basis = dot(qml.Identity(y), basis)  
    ###Qnode 3
    broadcast(basis,r,"single")              
    ###Qnode 
    grovers = gr.calculate(qubits,wire)                 
            
    return qml.expval(qml.Identity(0))                  


