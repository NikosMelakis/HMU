%x(n)=3u(n+5)
[n1, x1] = uk(-5,-10,8);
x1=x1*3;
figure(1)
stem(n1,x1);
title("x(n)=3u(n+5)");

%x(n)=u(n)-u(n-10)
[n2, x2]=uk(0,-2,12);
[n3, x3]=uk(10,-2,12);
x4=x2-x3;
figure(2)
stem(n2,x4);
title("x(n)=u(n)-u(n-10)");

%x(n)=(u(n+5)+u(n+5)*u(n-2)
[n4,x5]=uk(-5,-10,10);
[n5,x6]=uk(2,-10,10);
x7=x5;
x8=x5.*x6;
x9=x7+x8;
figure(3)
stem(n4,x9);
title("x(n)=(u(n+5)+u(n+5)*u(n-2))");

%x(n)=srt(p)((d(n+10)-3d(n-7))
[n10,x10]=dk(-10,-20,20);
[n11,x11]=dk(7,-20,20);
x12=sqrt(pi)*(x10-3*x11);
figure(4)
stem(n10,x12);
title("x(n)=srt(p)((d(n+10)-3d(n-7)))");