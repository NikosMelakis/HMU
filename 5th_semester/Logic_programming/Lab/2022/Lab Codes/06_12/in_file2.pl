test:-
    tell('C:/Users/Melakis/Desktop/out_file'),
    see('C:/Users/Melakis/Desktop/in_filee.txt'),
    int_division,
    seen,
    told.

int_division :-
            read(X),
            \+(X = end_of_file),
            read(Y), 
            \+(Y = end_of_file), 
            \+(Y = 0),
            Z is X//Y, 
            write('The quotient '),
            write(X), 
            write(' divided by '), write(Y), write(' is '),
            write(Z), 
            nl, 
            int_division.
int_division.