n=0:100; 
u=inline('n>=0');
a=[1 0 0.9];  
b=[0.3 0.6 0.3]; 
y=filter(b, a, u(n));
figure
plot(n, y);
title('Vhmatikh Apokrish gia to  aitiato shma y(n)=0.3x(n)+0.6x(n-1)+0.3x(n-2)-0.9y(n-2)')
ylabel('Aksonas y');
xlabel('Aksonas n');
