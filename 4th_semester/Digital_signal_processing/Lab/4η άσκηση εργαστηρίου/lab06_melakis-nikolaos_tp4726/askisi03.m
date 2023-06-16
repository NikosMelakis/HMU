Fs=5000;
Ts=1/Fs;
t=0:Ts:20*Ts;
x=5*cos(1000*pi*t)*cos(4000*pi*t)
plot(t, x, 'o-')