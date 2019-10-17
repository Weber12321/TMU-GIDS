# -*- coding: utf-8 -*-
"""
Created on Wed Oct 16 11:15:47 2019

@author: Weber
"""

grades = {'小明':91,'阿華':86,'拉拉':68}
input_type = str(input('請輸入要查詢的學生姓名 :'))
if input_type in grades.keys():
    print('{0}的成績 : {1}'.format(input_type,grades.get(input_type)))
else:
    new_grade = int(input('請輸入學生成績 :'))
    grades[input_type] = new_grade
    print('成績內容 : {0}'.format(grades))