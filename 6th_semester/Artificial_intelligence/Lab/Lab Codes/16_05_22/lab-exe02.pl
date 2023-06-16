%set_prolog_flag(encoding, utf8).


start:-
	write('Δώσε ουσιαστικό'), nl,
	read(Noun), 
	\+ Noun = end, nl, 
	create_print_sentence(Noun),
	start.
	
start:-
	write('Τέλος προγράμματος'), nl.
	
create_print_sentence(Noun):-
	atom_codes(Noun,Ncodes),
	append(Lthema,[X1,X2], Ncodes),	Lkatal = [X1,X2],
	atom_codes(Thema, Lthema),
	atom_codes(Κatal,Lkatal),
	noun(A1, A2, A3,[Thema, T], A4, [Katal,K], A6),
	endingNoun(A6, B1, Enikos, Plith),
	enikos_print(Thema,Enikos),
	plith_print(Thema, Plith).
	
enikos_print(Thema,[]).
enikos_print(Thema,[H|T]):-
	atom_codes(Thema,Cth),
	atom_codes(H,Ckatal),
	append(Cth, Ckatal, Clexi),
	atom_codes(Lexi, Clexi),
	print(Lexi),
	write('   '),nl,
	enikos_print(Thema,T).
	
plith_print(Thema,[]).
plith_print(Thema,[H|T]):-
	atom_codes(Thema,Cth),
	atom_codes(H,Ckatal),
	append(Cth, Ckatal, Clexi),
	atom_codes(Lexi, Clexi),
	print(Lexi), 
	write('   '),nl,
	plith_print(Thema,T).

noun(κοινο, αρσ, ισοσυλ, [νικητ, νικητ], [οξυτονη, οξύτονη], [ης, ες], nounEnding02).
noun(κοινο, αρσ, ισοσυλ, [ναυτ, ναυτ], [παροξύτονη, παροξύτονη], [ης, ες], nounEnding01).
noun(κοινο, ουδ, ανισο, [κυμ, κυματ], [παροξύτονη, παροξύτονη], [α, α], nounEnding03).
noun(κοινο, ουδ, ανισο, [ονομ, ονοματ], [προπαροξύτονη, προπαροξύτονη], [α, α], nounEnding03).


endingNoun(nounEnding01, αρσ_ισο_ης, [ης, η, η, η], [ες, ων, ες, ες]).
endingNoun(nounEnding02, αρσ_ισο_ης, [ής, ή, ή, ή], [ές, ών, ές, ές]).
endingNoun(nounEnding03, αρσ_ανισο_α, [άς, ά, ά, ά], [ας, ών, ας, ας]).


%atom_codes(νικητης,L),append(L1,[X1,X2],L),atom_codes(Thema,L1),atom_codes(Katal,[X1,X2]).