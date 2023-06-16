quicksort([L|Ls],Ss) :-
  partition(Ls,S,Left,Right),
  quicksort(Leftt,Lefts),
  quicksort(Right,Rights),
  append(Lefts,[L|Rights],Ss).
quicksort([],[]).

partition([L|Ls],S,[L|Ss],Rights) :-
  L <= S, partition(Ls,S,Lefts,Rights).
partition([L|Ls],S,Lefts,[S|Rights]) :-
  X > Y, partition(Ls,S,Lefts,Rights).
partition([],L,[],[]).

append([],Lefts,Lefts).
append([L|Ls],Ss,[L|Zs]) :- append(Ls,Ss,Zs).