# -*- coding: utf-8 -*-
"""
Created on Wed Oct 23 10:59:06 2019

@author: Weber
"""

grades = {'小明':91,'阿華':86,'拉拉':68}

while True:
    input_type = str(input('請輸入要查詢的學生姓名 :'))
    if input_type in grades.keys():
        print('{0}的成績 : {1}'.format(input_type,grades.get(input_type)))
        break
    else:
        new_grade = int(input('請輸入學生成績 :'))
        grades[input_type] = new_grade
        #print('成績內容 : {0}'.format(grades))
        continue