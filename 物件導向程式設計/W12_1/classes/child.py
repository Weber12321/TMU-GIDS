from classes.parent import *

class Child(Parent):
    def __init__(self):
        super().__init__()

    def get_super_public_var(self):
        return self.public_var

    def get_super_protected_var(self):
        return self._protected_var

    def get_super_private_var(self):
        return self.__private_var

    def call_super_public_method(self):
        return self.public_method()

    def call_super_protected_method(self):
        return self._protected_method()

    def call_super_private_method(self):
        return self.__private_method()

    def get_super_public_static_var(self):
        return Child.public_var

    def get_super_protected_static_var(self):
        return Child._protected_var
    
    def get_super_private_static_var(self):
        return Child.__private_var

    def call_super_public_static_method(self):
        return Child.public_static_method()

    def call_super_protected_static_method(self):
        return Child._protected_static_method()

    def call_super_private_static_method(self):
        return Child.__private_static_method()
    