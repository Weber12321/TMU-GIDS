from shape.shapeobject import *
class Rectangle(ShapeObject):
    def __init__(self, length, width):
        self.__length = length
        self.__width = width

    def show_shape_info(self):
        print('Rectangle length :' + str(self.__length) + ',' + 'Rectangle wide' + str(self.__width))

    def get_area(self):
        return self.__length * self.__width