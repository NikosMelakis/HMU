n=0:100;                   
s=zeros(1,length(n));      
u=inline('n>=0');     
s(1)=1;                   
for i=2:length(n)
 s(i)=0.3*u(n(i)) + 0.6*u(n(i)-1) + 0.3*u(n(i)-2) - 0.9*u(i-2);   
end
figure                 
stem(n,s);                  
title('Vhmatiki Apokrish gia to  aitiato shma y(n)=0.3x(n)+0.6x(n-1)+0.3x(n-2)-0.9y(n-2)')
ylabel('Aksonas y');        
xlabel('Aksonas n');      


