d=inline('n==0');  
h(1)=1;
for n=2:101
 h(n) = 0.32 * d(n) + 0.68 * d(n-1)+ 0.4 * d(n-2) -  0.6* h(n-2) ; 
end
figure;                   
stem(0:100,h);  
title('Kroustikh Apokrish gia to  aitiato shma y(n)=0.32x(n)+0.68x(n-1)+0.4x(n-2)-0.6y(n-2)')  
xlabel('aksonas n');          
ylabel('aksonas h');   