from shape.shapeobject import *
class Square(ShapeObject):
    def __init__(self, size):
        self.__size = size

    def show_shape_info(self):
        print('Square size' + str(self.__size))

    def get_area(self):
        return self.__size * self.__size    
