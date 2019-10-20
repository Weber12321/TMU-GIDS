# -*- coding: utf-8 -*-
"""
Created on Sun Oct 20 22:12:14 2019

@author: doudi
"""
import jieba
import re

def open_txt(path1, st_word):
    seg=[]
    seg_result=[]
    with open(path1, 'r', encoding='UTF-8') as file:
        text = file.read()      
        # remove what is not in Chinese characters
        r = re.compile(u'[^\u4e00-\u9fa5]')
        text = r.sub(r'',text)
        # corpus
        seg = jieba.cut(text, cut_all=False)
        seg_result = list(filter(lambda a: a not in st_word, seg))
        # write a file to see corpus outcome
        with open('C:/Users/doudi/Downloads/偵錯.txt', 'w',encoding='utf-8') as out_file:
            out_file.write("\n".join(seg_result))
        # calculate the accumulated term numbers : Method【1】
        from collections import Counter
        c = Counter()
        for x in seg_result:
            if len(x)>1 and x != '\r\n':
                c[x] += 1
        for (k,v) in c.most_common(30):# 输出词频最高的前两个词
            print("%s:%d"%(k,v))
        
        return c