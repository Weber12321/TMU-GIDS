# -*- coding: utf-8 -*-
"""
Created on Wed Oct 16 10:53:19 2019

@author: Weber
"""

blood_type = {'A':'文靜穩重','B':'聰明浪漫','O':'自信堅強','AB':'理性智慧'}

input_type = str(input('請輸入要查詢的血型 :'))
input_type = input_type.upper()
if input_type in blood_type.keys():
    print('{0} 型的個性為 : {1}'.format(input_type,blood_type.get(input_type)))
else:
    print('沒有 {0} 型血型，說不定以後會有該突變種，嘻嘻!'.format(input_type))
    