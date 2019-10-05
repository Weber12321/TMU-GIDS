# -*- coding: utf-8 -*-
"""
Created on Sat Oct  5 14:30:34 2019

@author: Weber
"""

import string
import zhon.hanzi

t = ['12d$%^＠＃＄％','231}{_','21|}','234','12']

t = [''.join(c for c in s if c not in string.punctuation) for s in t]
t = [''.join(c for c in s if c not in zhon.hanzi.punctuation) for s in t]
print(t)