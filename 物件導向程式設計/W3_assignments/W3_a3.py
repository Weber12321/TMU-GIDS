# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 11:49:54 2019

@author: Weber
"""

# W3 作業3 成績公式

print('段考辛苦了，讓我幫你計算各科成績總分!')

name = str(input('請輸入您的姓名 :'))
chinese = int(input('請輸入你的國文段考分數 :'))
math = int(input('請輸入你的數學段考分數 :'))
english = int(input('請輸入你的英文段考分數 :'))

total_score = chinese + math + english

print('{:s}這回段考總成績為: {:d}'.format(name,total_score))