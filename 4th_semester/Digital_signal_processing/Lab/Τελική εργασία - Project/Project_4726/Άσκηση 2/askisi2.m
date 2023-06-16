n=[-2,-1,0,1,2,3,4,5,6,7]; #πίνακας x(n)
x=[-1,0,1,2,4,5,4,-5,-8,-9]; #πίνακας για n
figure(1);
[y1,n1]=sigshift(x,n,1); #x[n-1] 
y1=2*y1; #2*x[n-1]
[y2,n2]=sigshift(x,n,-4); #x[n+4]
y2=-3*y2; #3*x[n+4]
[y3,n3]=sigadd(y1,n1,y2,n2);#2*x[n-1]-3*x[n+4]
plot(n3,y3);
title('Grafikh parastasi gia y(n)=2x(n-1)-3x(n+4)');
xlabel('aksonas n');
ylabel('aksonas y');
figure(2);
[g1,n1]=sigshift(x,n,3);  #x[n-3]
[g2,n2]=sigfold(g1,n1); #x[3-n]
[g3,n3]=sigshift(x,n,2); #x[n-2]
[g4,n4]=sigshift(x,n,0); #x[n]
[g5,n5]=sigmult(g3,n3,g4,n4); #x[n]*x[n-2]
[g6,n6]=sigadd(g2,n2,g5,n5);#x[3-n]+x[n]*x[n-2]
plot(n6,g6);
title('grafikh parastash gia  g(n)=x(3-n)+x(n)*x(n-2)');
xlabel('aksonas n');
ylabel('aksonas g');