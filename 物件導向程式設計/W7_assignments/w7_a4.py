# -*- coding: utf-8 -*-
"""
Created on Wed Oct 23 11:58:43 2019

@author: Weber
"""

import time 

t = time.localtime()
print(t)
current_time = time.strftime("%H:%M:%S", t)
print(current_time)