function [ n,d ] = dk(k, minN, maxN)
n=[minN:maxN];
d=zeros(1,length(n));
for i=1:length(n)
if n(i)==k
d(i)=1;
break;
endif
endfor
endfunction
function [ n,u ] = uk(k, minN, maxN)
n=[minN:maxN];
u=zeros(1,length(n));
for i=1:length(n)
if n(i)>=k
u(i)=1;
endif
endfor
endfunction