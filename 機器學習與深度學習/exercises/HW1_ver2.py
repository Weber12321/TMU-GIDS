# -*- coding: utf-8 -*-
"""
Created on Sun Oct 20 23:13:50 2019

@author: doudi
"""

# 1.--- load dictionary and stop_words 
import jieba
jieba.set_dictionary('C:/Users/doudi/Downloads/dict.txt.big')

# load stop word file
stw=[]
with open('C:/Users/doudi/Downloads/chineses_stop_word.txt', 'r') as file:
    for data in file.readlines():
        data = data.strip()
        stw.append(data)
# 2.--- read file and segmentation and remove stop_words
import re
def Cleaning(line):
    r = re.compile(u'[^\u4e00-\u9fa5]')
    line = r.sub(r'',line)
    
    return line
# load data by "each article"
files = []
with open('C:/Users/doudi/Downloads/ChineseDataset_Assignment1.txt', 'r', encoding='utf-8') as file:
    for l in file: 
        l = l.strip()
        l = Cleaning(l)
        files.append(l)
corpus = []
for s in files:
    seg = jieba.cut(s, cut_all=False)
    seg_result = list(filter(lambda a: a not in stw, seg))
    corpus.append(seg_result)

# 3.--- calculate tf
# split all terms together to calculate global tf
split_corpus = []
for item in corpus:
    for word in item:
        split_corpus.append(word)

# use collection.counter to zip words and counts as dict
from collections import Counter
c = Counter()
for x in split_corpus:
    if len(x)>1 and x != '\r\n':
        c[x] += 1
# output ranking 30
for (k,v) in c.most_common(30):
    print("%s:%d"%(k,v))

# sort the dict by value
import operator
tf = sorted(c.items(), key=operator.itemgetter(1), reverse=True)

# 4. --- plot the Zipf's graph (ranking 30)
ext30_tf = tf[0:30]

import plotly.graph_objects as go
x = list(range(1,31))
y = []

n = 1 
temp = [m[n] for m in ext30_tf]


for i in range(len(temp)):
    y.append(temp[i])
#    y.append((temp[i]/sum(temp)))

fig = go.Figure(go.Scatter(x=x, y=y, mode='lines+markers', name='lines+markers'))
fig.update_layout(title='Zipf‘s law chart (extract ranking 30)',xaxis_title='Ranking',yaxis_title='Term freq')
fig.show()

# 5. --- calculate idf
# unzip terms only from tf tuple-list
res = [[ i for i, j in tf ], [ j for i, j in tf ]] 
tf_word = res[0]# word ordering by tf value
tf_val = res[1]# tf value decs

# use tf words' ordering to calculate corresponding idf
df = []
for word in tf_word:
    count = 0
    for sentence in corpus:
        if word in sentence:
            count += 1 
    df.append(count)    
from math import log
idf = []
for y in df:
    N = len(corpus)
    idf_temp = log((N/y),10)
    idf.append(idf_temp)
    
# 6. --- calculate tfidf and sorting
# output tfidf by multiply tf and idf in same ordering
tfidf_val = [a*b for a,b in zip(tf_val,idf)]
tfidf = dict(zip(tf_word,tfidf_val))
# sort tfidf by the value
tfidf_ans = sorted(tfidf.items(), key=operator.itemgetter(1), reverse=True)

for (k,v) in tfidf_ans.most_common(30):# 輸出詞頻最高的前兩個詞
    print("%s:%d"%(k,v))