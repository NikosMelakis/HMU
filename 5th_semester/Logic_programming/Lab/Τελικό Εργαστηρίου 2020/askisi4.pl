SelectionSort([],[]).
SelectionSort([H|T],Out) :- 
    Se(T,H,Min,Inputr),
    SeSo(Inputr,Outr) , 
    concat([Min],Outr,Out).
Se([],El,El,[]).
Se([X|Xs],Test,El,[X|Rest]) :-
    Test <= X , 
    Se(Xs,Test,El,[Test|Rest]).
Se ([X|Xs],Test,El,[Test|Rest]) :- 
    Se(Xs,X,El,Rest).


concat([H|T],Q2,[H|Rest]):-
    concat(T,Q2,Rest).