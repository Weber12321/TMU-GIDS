from classes import *

s = Child()

print(s.get_super_public_var())
print(s.get_super_protected_var())

print(s.call_super_public_method())
print(s.call_super_protected_method())

print(s.get_super_public_static_var())
print(s.get_super_protected_static_var())

print(s.call_super_public_static_method())
print(s.call_super_protected_static_method())