%�������_1�
n=0:15;                             
d=inline('n==0');                   
a=[1 0  0.1 0 0.06 0];      %����������� y    
b=[0.2 0.5  0  0  0  0.4];  %����������� �    
h=filter(b, a, d(n));               
stem(n, h);                     
xlabel('aksonas n');                        
ylabel('aksonsas h(n)');                     

%�������_2�
x=[-1,0,1,2,4,5,4,-5,-8,-9];  %����������� � 
y=conv(x,h);                  %��������  
plot(y)
xlabel('aksonas x');          %����� ����� x
ylabel('aksonas y');          %����� ����� y


%�������_3�
x=[-1,0,1,2,4,5,4,-5,-8,-9];        
y2=filter(b, a, x);                 
hold on; 
plot(y2);        
xlabel('aksonas x');           %����� ����� x
ylabel('aksonas y');           %����� ����� y
              
%�������_4�
freqz(b, a)