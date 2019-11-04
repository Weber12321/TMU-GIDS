# -*- coding: utf-8 -*-
"""
Created on Fri Nov  1 09:46:08 2019

@author: Weber
"""

import datetime as dt
from time import sleep

def run_time():
    while True:
        print(dt.datetime.now())
        sleep(60)
        
            
    