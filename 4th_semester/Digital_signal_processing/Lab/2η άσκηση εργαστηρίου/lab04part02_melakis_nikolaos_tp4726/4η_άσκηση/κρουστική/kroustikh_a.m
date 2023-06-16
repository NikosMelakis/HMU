d=inline('n==0');  
h(1)=1;
for n=2:101
 h(n) = 0.3 * d(n) + 0.6 * d(n-1)+ 0.3 * d(n-2) -  0.9* h(n-2) ; 
end
figure;                   
stem(0:100,h);  
title('Kroustikh Apokrish gia to  aitiato shma y(n)=0.3x(n)+0.6x(n-1)+0.3x(n-2)-0.9y(n-2)')  
xlabel('aksonas n');          
ylabel('aksonas h');   