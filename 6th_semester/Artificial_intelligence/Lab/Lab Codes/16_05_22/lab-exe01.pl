sentence_to_list_of_words(ListOfWords):- 
    read(X),
    atom_codes(X,L), 
    make_list_of_words(L,ListOfWords).

make_list_of_words([],[]):- !.

make_list_of_words(L,[Word|Out]):-
    L\==[], 
    get_word(L,Rest,WordChs),
    atom_codes(Word,WordChs), 
    make_list_of_words(Rest,Out).

get_word([],[],[]):- !.

get_word([46|_],[],[]):- !.

get_word([44|T],T,[]):- !. 

get_word([32|T],T,[]):- !. 
get_word([H|T],Rest,[H|List]):- 
    get_word(T,Rest,List).


%sentence_to_list_of_words(ListOfWords).