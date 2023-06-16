n=0:15;                             
d=inline('n==0');                   
a=[1 0  0.1 0 0.06 0];       
b=[0.2 0.5  0  0  0  0.4];  
h=filter(b, a, d(n));               
stem(n, h);                     
xlabel('aksonas n');                        
ylabel('aksonsas h(n)');  