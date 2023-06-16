sentence --> 
    noun_phrase(Num),
    verb_phrase(Num).
    
noun_phrase(Num) --> 
    noun(Num);
    article, noun(Num).
    
verb_phrase(Num) --> verb(Num);

verb(Num), noun_phrase(_Anything).
noun(singular) --> 
    [boy];[ball]; [book];['Heraklion'].
noun(plural) --> 
[boys];[balls];[books].
verb(singular) --> 
    [kicks];[reads].
verb(plural) --> 
    [kick];[read].
article --> 
    [the];[a].

%Stoxoi
%sentence([the, boy, reads, a, book],[]).
%sentence([the, boys, read, books],[]).
%sentence([the, boy, read, a, book],[]).
%sentence([the, boys, reads, books],[]).