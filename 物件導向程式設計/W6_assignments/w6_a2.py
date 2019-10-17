# -*- coding: utf-8 -*-
"""
Created on Wed Oct 16 10:21:00 2019

@author: Weber
"""

grades = []
while True:
    scores = int(input('請輸入成績 :'))
    if 0 <= scores <=100:
        grades.append(scores)
        continue
    elif scores == -1:
        print('共有 {0} 位學生\n本般總成績 : {1} 分，平均成績 : {2} 分'.format(len(grades),sum(grades),sum(grades)/len(grades)))
        break
    else:
        print('您輸入的成績有誤，請重新輸入!!')
        continue