# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 11:38:31 2019

@author: Weber
"""

# W3 作業2 複利公式
print('小明您好，以下幫您計算n年後的儲存於本銀行本金\n煩請您輸入您目前儲存的本金\n與經過幾年')
money = float(input("您目前的本金 :"))
year = float(input("經過幾年? :"))
interest = 0.02
function = money*(1 + interest)**year

print('讓您久等了\n您的本金為: {:0}\n經過了: {:1}年\n增加為: {:3}'.format(money,year,function))                 