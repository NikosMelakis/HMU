n=0:15;                             
d=inline('n==0');                   
a=[1 0  0.1 0 0.06 0];      
b=[0.2 0.5  0  0  0  0.4];    
h=filter(b, a, d(n));              
stem(n, h);                     
xlabel('aksonas n');                        
ylabel('aksonsas h(n)');                     
x=[-1,0,1,2,4,5,4,-5,-8,-9];  
y=conv(x,h);                 
plot(y)
xlabel('aksonas x');          
ylabel('aksonas y');      
x=[-1,0,1,2,4,5,4,-5,-8,-9];        
y2=filter(b, a, x);                 
hold on; 
plot(y2);        
xlabel('aksonas x');           
ylabel('aksonas y');           
freqz(b, a)