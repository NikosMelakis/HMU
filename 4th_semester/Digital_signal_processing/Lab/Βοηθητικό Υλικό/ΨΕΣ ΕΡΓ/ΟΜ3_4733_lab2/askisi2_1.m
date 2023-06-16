%ερωτημα_1ο
n=0:15;                             
d=inline('n==0');                   
a=[1 0  0.1 0 0.06 0];      %συντελεστές y    
b=[0.2 0.5  0  0  0  0.4];  %συντελεστές χ    
h=filter(b, a, d(n));               
stem(n, h);                     
xlabel('aksonas n');                        
ylabel('aksonsas h(n)');                     

%ερωτημα_2ο
x=[-1,0,1,2,4,5,4,-5,-8,-9];  %συντελεστές χ 
y=conv(x,h);                  %συνέλιξη  
plot(y)
xlabel('aksonas x');          %όνομα άξονα x
ylabel('aksonas y');          %όνομα άξονα y


%ερώτημα_3ο
x=[-1,0,1,2,4,5,4,-5,-8,-9];        
y2=filter(b, a, x);                 
hold on; 
plot(y2);        
xlabel('aksonas x');           %όνομα άξονα x
ylabel('aksonas y');           %όνομα άξονα y
              
%ερώτημα_4ο
freqz(b, a)