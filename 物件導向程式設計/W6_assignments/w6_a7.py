# -*- coding: utf-8 -*-
"""
Created on Wed Oct 16 11:29:38 2019

@author: Weber
"""

medals = {'金牌':26,'銀牌':34,'銅牌':30}
for i in range(len(list(medals.keys()))):
    print('得到的 {0} 數目為 {1} 面'.format(list(medals.keys())[i],list(medals.values())[i]))