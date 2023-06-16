T=1/150;     
Ts=1/50000;  %δειγματοληψία
t=0:Ts:2*T;  %πίνακας χρόνου
x=6-2*cos(600*pi*t)+6*cos(1200*pi*t)+6*cos(1500*pi*t)-0.5*cos(6000*pi*t);  
plot(t,x);  
xlabel('aksonas t');     
ylabel('aksonas y');    

