# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 11:34:16 2019

@author: Weber
"""
i=1
j=1
for i in range(9):
    for j in range(9):
        print(i+1,'x',j+1,'=',(i+1)*(j+1),' ', end='')
        j += 1
    i += 1
    print('\n')