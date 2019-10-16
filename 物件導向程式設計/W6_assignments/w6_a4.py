# -*- coding: utf-8 -*-
"""
Created on Wed Oct 16 10:47:36 2019

@author: Weber
"""

grades = []
while True:
    scores = int(input('請輸入成績 :'))
    if 0 <= scores <=100:
        grades.append(scores)
        continue
    elif scores == -1:
        print('學生成績由大到小排序為 : {0}，平均成績 : {1} 分'.format(grades,sum(grades)/len(grades)))
        break
    else:
        print('您輸入的成績有誤，請重新輸入!!')
        continue