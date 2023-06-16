s --> 
    np, 
    vp.

np --> 
    pron; n; art, n.

vp --> 
    v; v, np.

v --> 
    [Word], {verb_lexicon(W,_X), name(W, L1), append(L1, "σ", L2), name(Word, L2)};
    [Word], {verb_lexicon(W,_X), name(W, L1), append(L1, "α", L2), name(Word, L2)};
    [Word], {verb_lexicon(W,_X), name(W, L1), append(L1, "ι", L2), name(Word, L2)};
    [Word], {verb_lexicon(W,_X), name(W, L1), append(L1, "ιά", L2), name(Word, L2)};
    [Word], {verb_lexicon(W,_X), name(W, L1), append(L1, "ουν", L2), name(Word, L2)};
    [Word], {verb_lexicon(W,_X), name(W, L1), append(L1, "ει", L2), name(Word, L2)};
    [Word], {verb_lexicon(W,_X), name(W, L1), append(L1, "εις", L2), name(Word, L2)};
    [Word], {verb_lexicon(W,_X), name(W, L1), append(L1, "ω", L2), name(Word, L2)}.


pron --> 
    [εγώ]; [εσύ]; [αυτός].

art --> 
    [το]; [του]; [τα]; [το].


verb_lexicon(παιζ, γραφ).

noun_lexicon(παιδ, ποδόσφαιρ, προγραμμ).


%s([εγώ, παίζω, ποδόσφαιρο], []). 
%s([εσύ, γράφεις, το, πρόγραμμα], []). 
%s(X, []).









