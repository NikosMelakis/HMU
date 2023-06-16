# Διαχειριζόμαστε τον αριθμό που μας δίνεται σαν String
decimalToBinary(String, Decimal) :-
    string_chars(String,Chars),
    decimalToBinary_(Chars,0,Decimal).

decimalToBinary_(['1'|Cs],N,Decimal) :-
    M is 2 * N + 1,
    decimalToBinary_(Cs,M,Decimal).    

decimalToBinary_(['0'|Cs],N,Decimal) :-
    M is 2 * N,
    decimalToBinary_(Cs,M,Decimal).    

decimalToBinary_([],Decimal,Decimal).

