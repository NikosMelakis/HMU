sentence --> 
    noun_phrase(Num),
    verb_phrase(Num).

noun_phrase(Num) --> 
    noun(Num);article,noun(Num).

verb_phrase(Num) --> 
    verb(Num); verb(Num),
    noun_phrase(_Anything).

noun(singular)-->
    [Word], {noun_lexicon(Word,_X)}.

noun(plural)-->
    [Word], {noun_lexicon(_X, Word)}.

verb(singular) --> 
    [Word], 
    {verb_lexicon(W,_X,_Y),
    name(W,L1),
    append(L1,"s",L2),
    name(Word,L2)}.

verb(plural) --> 
    [Word], 
    {verb_lexicon(Word,_X,_Y)}.

article --> 
    [the];[a].


noun_lexicon(boy, boys).
noun_lexicon(ball, balls).
noun_lexicon(book, books).
noun_lexicon(wolf, wolves).
verb_lexicon(kick, kicked, kicked).
verb_lexicon(read, read, read).

%Stoxoi
%sentence([the, boy, reads, a, book],[]).
%sentence([the, boys, read, books],[]).
%sentence([the, boy, read, a, book],[]).
%sentence([the, boys, reads, books],[]).