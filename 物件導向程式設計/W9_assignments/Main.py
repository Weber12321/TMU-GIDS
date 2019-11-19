# -*- coding: utf-8 -*-
"""
Created on Wed Nov 20 04:36:39 2019

@author: doudi
"""

import Campus as ca

def show_students(classroom1, classroom2):
    print('Classroom1: ')
    print('Teacher: ', str(classroom1.get_teacher().get_data()))
    for s in classroom1.get_all_students():
        print(s.get_data)

    print('Classroom2: ')
    print('Teacher: ', str(classroom2.get_teacher().get_data()))
    for s in classroom2.get_all_students():
        print(s.get_data)

student1 = ca.Student('Student1', 100, 100, 100)
student2 = ca.Student('Student2', 90, 90, 90)
student3 = ca.Student('Student3', 80, 80, 80)
student4 = ca.Student('Student4', 70, 70, 70)
student5 = ca.Student('Student5', 60, 60, 60)

classroom1 = ca.Classroom()
classroom2 = ca.Classroom()

t1 = ca.Teacher('Peter', 32)
t2 = ca.Teacher('Kelly', 40)

classroom1.set_teacher(t1)
classroom2.set_teacher(t2)

print('---- Add students ----')
classroom1.add_student(student1)
classroom1.add_student(student2)
classroom1.add_student(student3)
classroom2.add_student(student4)
classroom2.add_student(student5)
show_students(classroom1, classroom2)

print('---- Remove students ----')
classroom1.delete_student(student1)
classroom2.delete_student(student4)
show_students(classroom1, classroom2)

print('---- After class ----') 
classroom1.clear()
classroom2.clear()
show_students(classroom1, classroom2)