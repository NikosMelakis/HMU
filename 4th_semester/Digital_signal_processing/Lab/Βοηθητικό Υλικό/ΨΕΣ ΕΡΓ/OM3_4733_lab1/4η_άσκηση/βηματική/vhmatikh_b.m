n=0:100; 
u=inline('n>=0');
a=[1 0 0.6];  
b=[0.32 0.68 0.4]; 
y=filter(b, a, u(n));
figure
plot(n, y);
title('Vhmatikh Apokrish gia to  aitiato shma y(n)=0.32x(n)+0.68x(n-1)+0.4x(n-2)-0.6y(n-2)')
ylabel('Aksonas y');
xlabel('Aksonas n');
