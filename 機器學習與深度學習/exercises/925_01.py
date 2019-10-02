# -*- coding: utf-8 -*-
"""
Created on Wed Sep 25 16:55:40 2019

@author: Weber
"""

import logging
from gensim.models import word2vec

logging.basicCt='%(asctime)s : %(levelname)s :  %(message)s', level=logging.INFO)
sentences = word2vec.Lonfig(formaineSentence("text8")
model = word2vec.Word2Vec(sentences, size = 300)
model.save("word2vec.model")