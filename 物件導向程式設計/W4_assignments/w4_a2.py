# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 10:35:01 2019

@author: Weber
"""

def grade():
    while True:
        score = int(input('plz enter your grade here.'))
        if 90 <= score <=100:
            print('優等')
            break
        elif 80 <= score < 90:
            print('甲等')
            break
        elif 70 <= score < 80:
            print('乙等')
            break
        elif 60 <= score < 70:
            print('丙等')
            break
        elif score < 60:
            print('丁等')
            break
        else:
            print('成績錯誤，請重新輸入!')
            continue
grade()