# -*- coding: utf-8 -*-
"""
Created on Wed Oct 16 10:32:38 2019

@author: Weber
"""

fruits = ['香蕉','蘋果','橘子','鳳梨','西瓜']
while True:
    delete = str(input('請輸入要刪除的水果(Enter 結束) :'))
    if delete == 'Enter':
        print('您所要購買的水果條目為以下 : {0}'.format(fruits))
        break
    elif delete not in fruits:
        print('{0} 不在水果條目之中，請重新輸入您要捨去的水果!!\n您所要購買的水果條目為以下 : {1}'.format(delete,fruits))
        continue
    else:
        fruits.remove(delete)
        print('您所要購買的水果條目為以下 : {0}'.format(fruits))
        continue