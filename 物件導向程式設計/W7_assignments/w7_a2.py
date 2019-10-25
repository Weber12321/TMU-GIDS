# -*- coding: utf-8 -*-
"""
Created on Wed Oct 23 10:48:22 2019

@author: Weber
"""

t = str(input('Please input time (yyyy-mm-dd) :'))
def time_format(time):
    split_t = t.split('-')
    print('西元{0}年{1}月{2}日'.format(split_t[0],split_t[1],split_t[2]))

time_format(t)