# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 10:44:11 2019

@author: Weber
"""

def discont():
    cus = int(input('plz enter your $$$!!'))
    if cus >= 100000:
        n_cus = int(cus*0.8)
        print('you get 20% off.\nyou shall pay: {:0}'.format(n_cus))
    elif cus >=50000:
        n_cus = int(cus*0.85)
        print('you get 15% off.\nyou shall pay: {:0}'.format(n_cus))
    elif cus >=30000:
        n_cus = int(cus*0.9)
        print('you get 10% off.\nyou shall pay: {:0}'.format(n_cus))
    elif cus >=10000:
        n_cus = int(cus*0.95)
        print('you get 5% off.\nyou shall pay: {:0}'.format(n_cus))
    else:
        print("you don't have any discont, plz buy more~~")
        
        
discont()