elen(BE,L2,BKD):-
                BE=[],
                BKD=[].

elen([H1|T1],L2,L3):-
                    member(H1,L2),
                    elen(T1,L2,T3),
                    L3=[H1|T3].
                    
elen([H1|T1],L2,L3):-
                    \+member(H1,L2),
                    elen(T1,L2,T3),
                    L3=T3.