import shape as sh

c = sh.Circle(10)
r = sh.Rectangle(5, 2)
t = sh.Triangle(8, 3)
s = sh.Square(6)

shapes = c, r, t, s

for s in shapes:
    s.show_shape_info()
    print('Area :' + str(s.get_area()))
