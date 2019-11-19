# -*- coding: utf-8 -*-
"""
Created on Wed Nov 13 11:30:45 2019

@author: Weber
"""

from circle import *

c1 = circle(3)

print('radius :'+str(c1.get_radius()))
print('area :'+str(c1.get_area()))
print('perimeter :'+str(c1.get_perimeter()))

# ===

c2 = circle(5)
c2.set_radius(7)

print('radius :'+str(c2.get_radius()))
print('area :'+str(c2.get_area()))
print('perimeter :'+str(c2.get_perimeter()))