x1=[0:pi/90:4*pi];
y1=cos(x1);
figure(1)
plot(x1,y1,'g') 
grid 
title('cos')
xlabel('aksonas x')
ylabel('aksonas y')
x2=[-2*pi:pi/90:2*pi]; 
y2=sin(x2);
figure(2)
plot(x2,y2)
grid 
title('sin')
xlabel('aksonas x')
ylabel('aksonas y')