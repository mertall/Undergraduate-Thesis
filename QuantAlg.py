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
        self.y_prime = int(npp.random.uniform(0,self.N-1))
    
    def algorithm(self):
        N = self.N
        y = N
        y_prime = self.y_prime
        t = self.table
        while (time.clock()<(22.5*npp.sqrt(N)+1.4*npp.log(N)**2)):    
            for i<y in range(N):
                while t[y] > t[i]:

                y_prime=Algorithm.simulate(N,t,y)

                if y_prime < t(y):
                    i=N
            y = y_prime                                 
        return t[y]                                                     
