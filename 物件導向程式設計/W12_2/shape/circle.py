from shape.shapeobject import *
import math

class Circle(ShapeObject):
    def __init__(self, radius):
        self.__radius = radius

    def show_shape_info(self):
        print('Circle radius :' + str(self.__radius))

    def get_area(self):
        return math.pi * self.__radius * self.__radius