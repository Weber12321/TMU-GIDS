# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 10:35:01 2019

@author: Weber
"""

def grade():
    score = int(input('plz enter your grade here.'))
    if score >= 90:
        print('優等')
    elif score >= 80:
        print('甲等')
    elif score >= 70:
        print('乙等')
    elif score >= 60:
        print('丙等')
    elif score < 60:
        print('丁等')

grade()