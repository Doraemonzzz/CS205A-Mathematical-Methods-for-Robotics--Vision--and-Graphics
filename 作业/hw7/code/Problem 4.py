# -*- coding: utf-8 -*-
"""
Created on Sun May  5 10:35:24 2019

@author: qinzhen
"""

import numpy as np
import matplotlib.pyplot as plt

def Vandermon(X, k):
    #维度
    n = X.shape[0]
    #计算结果
    res = np.ones(n).reshape(-1, 1)
    x = np.copy(X)
    for i in range(k):
        res = np.c_[res, x]
        x *= X
    
    return res

x1 = np.linspace(-1, 1, 500).reshape(-1, 1)

K = [3, 5, 7, 9, 11]
for k in K:
    X = np.linspace(-1, 1, k).reshape(-1, 1)
    y = np.abs(X)
    Van = Vandermon(X, k-1)
    #计算系数
    a = np.linalg.solve(Van, y)
    #计算结果
    y1 = Vandermon(x1, k-1).dot(a)
    plt.plot(x1, y1, label="degree={}".format(k))
    
plt.legend()
plt.show()