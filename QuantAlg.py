# Written By Mridul Sarkar
# 6/16/20 14:18AM


import time
import numpy as npp
import qsharp

from QMSA import Algorithm_Odd, Algorithm_Even
from preprocess import information
from qsharp import Result

#https://arxiv.org/pdf/quant-ph/9605034.pdf / https://arxiv.org/pdf/quant-ph/9607014.pdf
class DH(object):
    def __init__(self,table):
        self.table = npp.ndarray.flatten(table)                
        self.N= len(self.table)
        self.y_prime = int(npp.random.uniform(0,self.N-1))
    
    def algorithm(self):
        N = self.N
        y = N
        #y_prime = self.y_prime
        t = self.table
        time_limit = (22.5*npp.sqrt(N)+1.4*npp.log(N)**2)
        q = preprocess.simulate(t,y_prime)
        while time.clock() < time_limit:    
            for i in range(N):
                while t[y] > t[i]:
                    j = N-i
                    if N // 2 :
                        y_prime= Algorithm_Even.simulate(j,N,q)
                    else: 
                        y_prime=Algorithm_Odd.simulate(j,N,q)

            if t(y_prime) < t(y):

                i=0

            y = y_prime 

        return y                                                      