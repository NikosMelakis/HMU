progonos(X, Y):-
            goneas(X,Y).

progonos(X, Y):-
            goneas(X, Z), progonos(Z, Y).

goneas(yannis, maria).
goneas(yannis, nikos).
goneas(nikos, anna).

