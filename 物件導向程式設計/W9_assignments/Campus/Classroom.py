# -*- coding: utf-8 -*-
"""
Created on Wed Nov 20 04:26:05 2019

@author: doudi
"""

class Classroom:
    def __init__(self):
        self._students = []
        self._teacher = None
    
    def add_student(self, student):
        self._students += [student]
        
    def delete_student(self, student):
        self._students.remove(student)
        
    def get_all_students(self):
        return self._students
    
    def clear(self):
        self._students.clear()
        
    def get_student_number(self):
        return len(self._students)
    
    def set_teacher(self, teacher):
        self._teacher = teacher
        
    def get_teacher(self):
        return self._teacher
    