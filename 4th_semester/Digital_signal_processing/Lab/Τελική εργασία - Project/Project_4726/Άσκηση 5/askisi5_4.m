T=1/150;     
Ts=1/50000;  
t=0:Ts:2*T;  
x=6-2*cos(600*pi*t)+6*cos(1200*pi*t)+6*cos(1500*pi*t)-0.5*cos(6000*pi*t);  
plot(t,x);  
xlabel('aksonas t');     
ylabel('aksonas y');    

hold on;
Fs=6000;            
Ts=1/Fs;           
t=0:Ts:2*T;       
x2=6-2*cos(600*pi*t)+6*cos(1200*pi*t)+6*cos(1500*pi*t)-0.5*cos(6000*pi*t);   
plot(t, x2, 'ro');            
xlabel('aksonas t');      
ylabel('aksonas y');      