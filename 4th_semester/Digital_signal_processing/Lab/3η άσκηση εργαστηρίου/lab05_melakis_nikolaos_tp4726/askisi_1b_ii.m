x=[4 -1 1 0 1 0 0 1 -1 0 2];
y=conv(x, h);
figure;
plot(y);
y2=filter(b, a, x);
hold on;
plot(y2,'r');
xlabel('aksonas x');                  
ylabel('aksonas y'); 