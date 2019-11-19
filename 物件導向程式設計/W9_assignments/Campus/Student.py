# -*- coding: utf-8 -*-
"""
Created on Wed Nov 20 04:10:16 2019

@author: doudi
"""

class Student:
    _count = 0
    
    def __init__(self, name, ch_score, en_score, math_score):
        Student._count += 1
        
        self.set_data(name, ch_score, en_score, math_score)
    
    @staticmethod
    def get_count():
        return Student._count
    
    def set_data(self, name, ch_score, en_score, math_score):
        self._name = name
        self._ch_score = Student._check_score(ch_score)
        self._en_score = Student._check_score(en_score)
        self._math_score = Student._check_score(math_score)
        
    def get_data(self):
        return self._name, self._ch_score, \
               self._en_score, self._math_score
               
    @staticmethod
    def _check_score(score):
        if 0 <= score <= 100:
            return score
        else:
            return 0
       