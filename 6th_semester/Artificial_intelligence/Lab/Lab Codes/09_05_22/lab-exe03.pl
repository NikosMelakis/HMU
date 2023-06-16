sentence(sentence(NP,VP)) -->
    noun_phrase(NP,Num), 
    verb_phrase(VP,Num).

noun_phrase(noun_phrase(N),Num) -->
    noun(N,Num).

noun_phrase(noun_phrase(Art,N),Num) -->
    article(Art), 
    noun(N,Num).

verb_phrase(verb_phrase(V),Num) -->
    verb(V,Num).

verb_phrase(verb_phrase(V,NP),Num) -->
    verb(V,Num), 
    noun_phrase(NP,_Anything).

noun(noun(Word),singular) --> 
    [Word],
    {noun_lexicon(Word,_X)}.

noun(noun(Word),plural) --> 
    [Word],
    {noun_lexicon(_X, Word)}.

verb(verb(Word),singular) --> 
    [Word],
    {verb_lexicon(W,_X,_Y), 
    name(W,L1),
    append(L1,"s",L2), 
    name(Word,L2)}.

verb(verb(Word), plural) -->
    [Word],
    {verb_lexicon(Word,_X,_Y)}.

article(article(the)) --> 
    [the].

article(article(a)) --> 
    [a].

noun_lexicon(boy, boys).
noun_lexicon(ball, balls).
noun_lexicon(book, books).
noun_lexicon(wolf, wolves).
verb_lexicon(kick, kicked, kicked).
verb_lexicon(read, read, read).

%Stoxoi
%sentence(ParseTree,[the,boy,reads,a,book],[]).
%sentence(ParseTree,[the,boy,kicks,the,ball],[]).
%sentence(ParseTree,[the,boy,kicks,the,car],[]).
%sentence(ParseTree,S,[]).