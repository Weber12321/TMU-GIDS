# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 11:45:46 2019

@author: Weber
"""

n = int(input('plz enter an integer :'))
i = 0
total =1
while i<n:
    i += 1
    total *= i


print('your input :{0}\n{0}!={1}'.format(n,total))

def zero(x):
    m = str(x)
    return len(m)-len(m.rstrip('0'))

print('there are',zero(total),'zeros')