% x=2:1:15000;
% a=1-(1./x);
% y=x-(x.^a);
% plot(x,y)
X=[0:pi/90:4*pi];
Y=[-2*pi:pi/90:2*pi]
figure(1)
plot (X,cos(X));
grid on 
figure(2)
plot (Y,sin(Y));
grid on 
Z=[-pi:pi];
figure(3)
plot (Z,cos(Z));
hold on 
plot (Z,sin(Z),'r+');
figure (4)
subplot(2,1,1)
plot (Z,cos(Z));
title ('cosine')
subplot(2,1,2)
plot (Z,sin(Z));
title ('sin')

