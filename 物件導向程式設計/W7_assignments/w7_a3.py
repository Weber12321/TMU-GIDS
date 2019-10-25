# -*- coding: utf-8 -*-
"""
Created on Wed Oct 23 11:36:59 2019

@author: Weber
"""

import random as r

lot = []

for i in range(6):
    number = r.randint(1,49)
    if number not in lot : 
        lot.append(number)
        
sp_lot = r.choice([i for i in range(1,50) if i not in lot])
print('本期大樂透中獎號碼為 {0}\n本期大樂透特別號為 {1}'.format(lot,sp_lot))
    