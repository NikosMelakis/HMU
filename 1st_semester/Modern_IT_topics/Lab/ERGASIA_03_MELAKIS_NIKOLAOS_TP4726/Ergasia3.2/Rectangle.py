import Point

class Rectangle:

    #constructor
    def __init__(self, p1, p2):
        self.p1 = p1
        self.p2 = p2
    
    #functions for width,height,perimeter,area and move onto layer
    def height(self):
        return abs(self.p1.y - self.p2.y)

    def width(self):
        return abs(self.p1.x - self.p2.x)

    def perimeter(self):
        return 2 * (self.height() + self.width())

    def area(self):
        return self.height() * self.width()

    def move_r(self,dx,dy):
        self.p1 = self.p1.move_p(dx,dy)
        self.p2 = self.p2.move_p(dx,dy)
