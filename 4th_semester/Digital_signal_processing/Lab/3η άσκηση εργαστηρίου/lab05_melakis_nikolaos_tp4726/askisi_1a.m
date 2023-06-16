n=0:10; 
d=inline('n==0'); 
a=[1 -1.1 0.5 0 0.3]; 
b=[0.5 -0.2 0 0 0]; 
h=filter(b, a, d(n)); 
stem(n, h); 
xlabel('aksonas n');                       
ylabel('aksonas h(n)');     
