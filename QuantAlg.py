# Written By Mridul Sarkar
# 6/6/20 2:43 AM

import time
import numpy as npp
import qsharp

from qsharp import Result

from QMSA import Algorithm

#https://arxiv.org/pdf/quant-ph/9605034.pdf / https://arxiv.org/pdf/quant-ph/9607014.pdf
class DH(object):
    def __init__(self,table):
        self.table = npp.ndarray.flatten(table)                
        self.N= len(self.table)
        self.y = int(npp.random.uniform(0,self.N-1))                

    
    def algorithm(self):
        N = self.N
        y = self.y
        t = self.table
        while (time.clock()<(22.5*npp.sqrt(N)+1.4*npp.log(N)**2)):    

            y_prime=Algorithm.simulate(N,y)

            if t(y_prime) < t(y):
                return y_prime
            else:                                    
                return y                                             
        
        return y                                                      
