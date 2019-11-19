# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 11:26:35 2019

@author: Weber
"""

import math

class circle:
    
    def __init__(self, radius):
        self._radius = radius
        
    def get_radius(self):
        return self._radius
    
    def set_radius(self, radius):
        self._radius =  radius
        
    def get_area(self):
        return math.pi*self._radius*self._radius
    
    def get_perimeter(self):
        return 2*math.pi*self._radius
    