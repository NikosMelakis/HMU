# kefali
eleml([],[],[]).
eleml([H1|T1],[H2|T2],L3):-
  \+ member(H1,H2),
  eleml(T1,T2).
eleml([H1|T1],L2,L3):-
  member(H1,T1),
  eleml(T1,T2),
  L2 = T2.
# Soma
belongs(X,[X|Tail]).
belongs(X,[H|Tail]).
eleml(L1,L2,L3):-
  occ(L1,L2,[]).
occ([],L2,L3):-
  L2 = L3.
occ([H1|T1],L2,L3) :-
  \+ belongs(H1,L3),
  append(L3,[H1],L4),
  occ(T1, L2, L4).
