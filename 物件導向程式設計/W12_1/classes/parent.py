class Parent:
    public_var = 'Parent_Static_Public_Variable'
    _protected_var = 'Parent_Static_Protected_Variable'
    __private_var = 'Parent_Static_Private_Variable'

    def __init__(self):
        self.public_var = 'Parent_Public_Variable'
        self._protected_var = 'Parent_Protected_Variable'
        self.__private_var = 'Pareent_Private_Variable'

    def public_method(self):
        return 'Parent_Public_Method'

    def _protected_method(self):
        return 'Parent_Protected_Method'

    def __private_method(self):
        return 'Parent_Private_Method'

    @staticmethod
    def public_static_method():
        return 'Parent_Static_Public_Method'
    
    @staticmethod
    def _protected_static_method():
        return 'Parent_Static_Protected_Method'

    @staticmethod
    def __private_static_method():
        return 'Parent_Static_Private_Method'
        