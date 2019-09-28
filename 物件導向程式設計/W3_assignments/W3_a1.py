# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 11:33:46 2019

@author: Weber
"""

# W3 作業1 梯形公式
# input parameter
print("Hi!這隻程式是用來計算梯形公式\n麻煩您輸入以下餐是以利計算^_^")
up = float(input("請輸入上底 :"))
down = float(input("請輸入下底 :"))
taka = float(input("請輸入高 :"))

area = ((up + down)*taka)/2

# calculation
print("根據您輸入的參數所得出的梯形面積為 : {:1}".format(area))