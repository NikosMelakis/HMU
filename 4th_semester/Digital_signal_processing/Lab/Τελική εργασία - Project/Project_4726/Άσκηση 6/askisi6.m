b=[0 0.5 0];  
a=[1 -1.7*cos(pi/16) 0.6];  
[z, p, c] = tf2zp(b, a);
zplane(z, p);
b=[4 0 -2];
a=[1 0 -1];
[r,p,k]=residuez(b,a)

