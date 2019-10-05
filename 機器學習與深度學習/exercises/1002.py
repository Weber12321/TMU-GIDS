# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 15:44:27 2019

@author: Weber
"""

import logging
from gensim.models import word2vec

logging.basicConfig(format = '%(asctime)s : %(levelname)s : %(message)s', level = logging.INFO)
sentences = word2vec.LineSentence('C:/Users/Weber/Documents/GitHub/TMU-GIDS/機器學習與深度學習/exercises/text8')
model = word2vec.Word2Vec(sentences, size=300)
model.save('word2vec.model')

res = model.most_similar('love', topn = 10)
for item in res:
    print(item[0], + "," + str(item[1]))
    
print("%s AND %s,LIKE %s AND... " % ('King', 'Queen', 'Man'))
res = model.most_similar(['King', 'Queen'],['Man'], topn=10)
for item in res:
    print(item[0], + "," + str(item[1]))
    
print('Calculation Cosine Similarity')
res = model.similarity('king', 'prince')
print(res)