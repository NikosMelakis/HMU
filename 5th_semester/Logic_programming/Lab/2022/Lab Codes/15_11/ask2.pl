elen1(L1,L2,L3):-
                NL3=[],
                elen1(L1,L2,NL3,L3).

elen1(BE, L2, NL3, L3):-
                    BE=[],
                    L3=NL3.

elen1([H1|T1],L2, NL3, L3):-
                    member(H1,L2),
                    append(NL3, [H1], NewNL3),
                    elen1(T1, L2, NewNL3, L3).

elen1([H1|T1], L2, NL3, L3):-
                    \+member(H1,L2),
                    NL3=NewNL3,
                    elen1(T1, L2, NewNL3, L3).



%STOXOI
%elen1([a,b,c,d,e], [a,d,c,w], L3).

%elen1([a,b,c,d,e], [f,g,h,h,h,w,w], L3).

