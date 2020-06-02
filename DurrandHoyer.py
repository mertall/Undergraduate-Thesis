# Written By Mridul Sarkar
# 6/2/20 10:16 AM

import time
import numpy as npp
import qsharp
from qsharp import Result

#https://arxiv.org/pdf/quant-ph/9605034.pdf / https://arxiv.org/pdf/quant-ph/9607014.pdf
class DH(object):
    def __init__(self,table):
        self.table = npp.ndarray.flatten(table)                
        self.N= len(self.table)
        self.y = int(npp.random.uniform(0,self.N-1))                
        
    
    def tree(self,s,t):
        return 
    
    def algorithm(self):
        N = self.N
        y = self.y
        t = self.table
        index=[]
        markers=[]
        while (time.clock()<(22.5*npp.sqrt(N)+1.4*npp.log(N)**2)):    
            
            index=self.tree(t,t[y])                   
            
            self.wire_num = len(index)

            if self.table(index(y_prime)) < self.table(self.y):
                return index(y_prime)                                      
                return y                                             
        
        return y                                                      
