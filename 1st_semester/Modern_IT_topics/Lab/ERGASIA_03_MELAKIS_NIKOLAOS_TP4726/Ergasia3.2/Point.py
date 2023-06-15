import math


class Point:
    #constructor
    def __init__(self, x, y):
        self.x = x
        self.y = y

    #distance from (0,0)
    def distance_from_origin(self):
        math.sqrt(pow(self.x, 2) + pow(self.y, 2))
    
    #move the point onto the layer
    def move_p(self, dx, dy):
        self.x = self.x + dx
        self.y = self.y + dy

    #just a function for display
    def display(self):
        print('(',self.x,',',self.y,')')
