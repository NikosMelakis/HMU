x1=[0:pi/90:4*pi];
y1=cos(x1); 
x2=[-2*pi:pi/90:2*pi];
figure(1)
subplot(2,1,1) #2 γραμμές 1 στήλη 1η θέση
plot(x1,y1,'r')
grid 
title('sin')
xlabel('aksonas x')
ylabel('aksonas y')
y2=sin(x2);
subplot(2,1,2)
plot(x2,y2,'g')
title('cos')
xlabel('aksonas x')
ylabel('aksonas y')
grid
