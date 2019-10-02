# -*- coding: utf-8 -*-
"""
Created on Wed Oct  2 10:20:12 2019

@author: Weber
"""

print("通關密語")



while True:
    code = int(input("請輸入密碼!!!"))
    if code == 1234:
        print('歡迎光臨!')
        break
    else:
        print ('密碼錯誤!重新輸入')
        continue