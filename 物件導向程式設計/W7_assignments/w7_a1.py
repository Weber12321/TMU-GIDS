# -*- coding: utf-8 -*-
"""
Created on Wed Oct 23 10:30:18 2019

@author: Weber
"""

def electronic_fee():
    list = []
    while True:
        f = int(input("請輸入電費 (-1 結束) :"))
        if f != -1:
            list.append(f)
            continue
        else :
            print('共輸入 {0} 個數\n最多電費為 : {1}\n最少電費為 : {2}\n電費總和為 :{3}\n電費大小順序為 : {4}'.format(len(list),max(list),min(list),sum(list),list))
            break

electronic_fee()