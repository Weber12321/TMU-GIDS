# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 11:12:43 2019

@author: Weber
"""

number = int(input('plz enter an integer...'))

# method 1

i = 1
for i in range(1,number+1):
    print(i ,end = '')
    i+=1
# method 2
''' 
a = list(range(1,number+1))
print(a)'''
