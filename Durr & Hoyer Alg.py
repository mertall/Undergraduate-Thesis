from pennylane import numpy as np
import qsharp
from SimpleGrover import SearchForMarkedInput
def Durr_Hoyer(table):
    table = np.ndarray.flatten(table)
    N = np.size(table)
    y = np.random.uniform(0,N-1)
    quantum_reg= np.zeros(N)
    marked = np.zeros(N)

    dev1 = qml.device("default.qubit",wire=N)
    
    while time.clock()<(22.5*sqrt(N)+1.4*log(N)^2):
        for i in [1:N]:
            quantum_reg[i]=(qml.qnodes.QubitQNode(i,dev1(wire=i))
            quantum_reg[i]=1/sqrt(N)*qml.qnodes.QubitQNode(quantum_reg[y],dev1(wire=i))*quantum_reg[i]
            if table[i] < table[y]:
                marked[i]=1
                continue
            else:
                continue
        quantum_reg=np.transpose(marked) * quantum_reg
        
        #modify grovers so that m=1 phi=6/5 phi can be between (1,4/3)
        y_prime=SearchForMarkedInput(quantum_reg)
        #if T[y_prime = min(T)] continue otherwise do grovers again, implement this into grover

        if table(y_prime) < table(y):
            return y_prime