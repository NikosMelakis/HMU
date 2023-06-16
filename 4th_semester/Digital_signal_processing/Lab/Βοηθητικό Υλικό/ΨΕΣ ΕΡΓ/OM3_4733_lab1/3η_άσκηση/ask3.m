#shma:x(n)=4u(n+7),-10<=n<=10
[x1 n1]=vima(-7,-10,10); #u(n-k) συνάρτηση #edo k=-7,(-10,10) 0ria n
x1=4*x1; #4*u
figure(1)
stem(n1,x1,'r') 
title('vhmatikh akolouthia shmatos:x(n)=4u(n+7) ')
xlabel('n1')
ylabel('x1')
#shma:x(n)=u(n)-u(n-10),-4<=n<=14
[x2 n2]=vima(0,-4,14);
[y2 n2]=vima(10,-4,14);
x2=x2-y2;
figure(2)
stem(n2,x2,'y')
title('vhmatikh akolouthia shmatos:x(n)=u(n)-u(n-10)')
xlabel(' aksonas n2')
ylabel(' aksonas x3')
#shma:x(n)=u(n+5)+u(n+4)*u(n-2),-10<=n<=11
[x3 n3]=vima(-5,-10,11);#(n+5)
[y3 n3]=vima(-4,-10,11);#(n+4)
[z3 n3]=vima(2,-10,11);9#(n-2)
x3=x3+(y3.*z3);
figure(3)
stem(n3,x3,'r')
title('vhmatikh akolouthia shmatos:x(n)=u(n+5)+u(n+4)*u(n-2)')
xlabel(' aksonas n3')
ylabel(' aksonas x3') 
#shma:x(n)=2u(n-AM)-u(n-AM-3),-AM -5<=N<=AM+10 #AM 4733
[x4 n4]=vima(4733,-4738,4743); #(n-am)
x4=2*x4; #2(u)
[y5,n5]=vima(4736,-4738,4743);
x4=x4-y5;#τελικό
figure(4)
stem(n4,x4)
title('vhmatikh akolouthia shmatos:x(n)=2u(n-AM)-u(n-AM-3)')
xlabel('aksonas n4')
ylabel('aksonas x4')