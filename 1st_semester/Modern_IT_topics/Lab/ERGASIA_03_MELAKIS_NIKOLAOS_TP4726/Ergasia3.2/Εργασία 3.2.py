from Point import Point
from Rectangle import Rectangle

while True:
    #two points for Rectangle R1
    #Create Rectangle one
    #Coordinators for p1
    #Create RectangleOne
    point1 = Point(0,0)
    point2 = Point(0,0)
    point3 = Point(0,0)
    point4 = Point(0,0)
    listOfPointsForR1 = [point1,point2]
    listOfPointsForR2 = [point3,point4]
    R1 =Rectangle(point1,point2)
    R2 = Rectangle(point3,point4)

    #Create Rectangle R1
    print('Enter two points to define Rectangle 1')
    j=1
    for i in range(2):
        x = float(input('Enter x-axis coordinator for point_'+str(j)+': '))
        y = float(input('Enter y-axis coordinator for point_'+str(j)+': '))
        listOfPointsForR1[i].x = x
        listOfPointsForR1[i].y = y
        j+=1
    R1.p1 = listOfPointsForR1[0]
    R1.p2 = listOfPointsForR1[1]
    print('\n')
    #Create Rectangle R2
    print('Enter two points to define Rectangle 2')
    j=1
    for i in range(2):
        x = float(input('Enter x-axis coordinator for point_'+str(j)+': '))
        y = float(input('Enter y-axis coordinator for point_'+str(j)+': '))
        listOfPointsForR2[i].x = x
        listOfPointsForR2[i].y = y
        j+=1
    R2.p3 = listOfPointsForR2[0]
    R2.p4 = listOfPointsForR2[1]

    #Make Perimeter Comparisons
    print('Which perimeter is bigger R1 or R2??')
    print('Perimeter of R1: ',R1.perimeter())
    print('Perimeter of R2: ',R2.perimeter())
    if R1.perimeter()>R2.perimeter():
        print('R1 perimeter is bigger')
    elif R1.perimeter()<R2.perimeter():
        print('Perimeter of R2 is bigger')
    else:
        print('The two perimeters are equal')

    #Make Area Comparisons
    print('Which area is bigger R1 or R2??')
    print('Area of R1: ',R1.area())
    print('Area of R2: ',R2.area())
    if R1.area()>R2.area():
        print('R1 area is bigger')
    elif R1.area()<R2.area():
        print('Area of R2 is bigger')
    else:
        print('The two areas are equal')
    val = input('Press "ENTER" to exit the program or any key to restart: ')
    if not val:
        exit()
    else:
        continue
