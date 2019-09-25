# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 15:34:27 2019

@author: Weber
"""

import jieba
import jieba.posseg as jseg  

# import dictionary
jieba.set_dictionary('dict.txt.big')
jieba.load_userdict('userdict.txt')

sentence = "蔡英文總統今天受邀參加台北市政府所舉辦的陽明山馬拉松比賽"
print("Input :", sentence)


segResult =jseg.cut(sentence)
print("Output 精確模式 Full Mode :")
for word in segResult:
    print(word.word, word.flag)