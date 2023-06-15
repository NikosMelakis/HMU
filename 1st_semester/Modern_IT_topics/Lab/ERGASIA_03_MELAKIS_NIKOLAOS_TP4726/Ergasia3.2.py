class Rectangle:
    
    def __init__(self):
        
        self.length = 1
        self.width = 1

    def set_width(self, width):
        self.width = width

    def set_length(self, length):
        self.length = length

  
    def get_width(self):
        return self.width

    def get_length(self):
        return self.length

    def get_area(self):
        return self.length * self.width


    def __str__(self):
        return 'length = {}, width = {}'.format(self.length, self.width)


class Point:
  def __init__(self, x, y):
    self.x, self.y = x, y

  def __str__(self):
    return "{}, {}".format(self.x, self.y)

  def __neg__(self):
    return Point(-self.x, -self.y)

  def __add__(self, point):
    return Point(self.x+point.x, self.y+point.y)

  def __sub__(self, point):
    return self + -point



def compute_Area():
    area = length * width
    return area

def comparison_Area():
    print()
    print('Το εμβαδόν του πρώτου παραλληλόγραμμου είναι: ', area1)
    print('Το εμβαδόν του δεύτερου παραλληλόγραμμου είναι: ', area2)
    if area1 > area2:
        print('Το εμβαδόν του πρώτου παραλληλόγραμμου είναι μεγαλύτερο.')
    elif area1 < area2:
        print('Το εμβαδόν του δεύτερου παραλληλόγραμμου είναι μεγαλύτερο.')
    elif area1 == area2:
        print('Τα εμβαδά είναι ίσα.')



def main():
    length1 = int(input('Μήκος του πρώτου παραλληλόγραμμου: '))
    width1 = int(input('Πλάτος του πρώτου παραλληλόγραμμου: '))
    area1 = compute_Area(length1, width1)
    length2 = int(input('Μήκος του δεύτερου παραλληλόγραμμου: '))
    width2 = int(input('Πλάτος του δεύτερου παραλληλόγραμμου: '))
    area2 = compute_Area(length2, width2)
    comparison_Area(area1, area2)

