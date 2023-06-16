kb('Γιάννης', male, 20, student, maths, univOfCrete).
kb('Ελένη', female, 21, student, maths, univOfCrete).
kb('Μάνος', male, 40, academicStaff, maths, univOfCrete).
kb('Κώστας', male, 50, academicStaff, maths, univOfCrete).
kb('Πάνος', male, 20, student, ece, hmu).
kb('Μαρία', female,19, student, ece, hmu).
kb('Νίκος', male, 45, academicStaff, ece, hmu).
kb('Γιώργος',male, 52, academicStaff, ece, hmu).
kb('Νίκη', female, 19, student, electronics, hmu).
kb('Άρης',male, 20, student, electronics, hmu).
kb('Σπύρος', male, 60, academicStaff, electronics, hmu).
kb('Γιάννα', female, 56, academicStaff, electronics, hmu).
kb('Δημήτρης', male, 19, student, ece, technUnivOfCrete).
kb('Μιχάλης', male, 22, student, ece, technUnivOfCrete).
kb('Φανή', female, 57, academicStaff, ece, technUnivOfCrete).
kb('Αντώνης', male, 65, academicStaff, ece, technUnivOfCrete).


collect_results :-
	write('Select one of these 5 choices :'),nl,
	write('1 : Read Uni name'),nl,
	write('2 : Read University'),nl,
	write('3 : Read Departement'),nl,
	write('4 : Read University and 2 ages'),nl,
	write('5 : Exit'),nl,
	read(X),
	f(X),
	collect_results.

f(X):-
	X=:=1,!,
	write('Give Uni name'),nl,
	read(UniName),
	bagof(Y,kb(UniName,academicStaff,Y),L),
	write(Name),write(' academicStaff : '),write(L),nl,
	bagof(Z,kb(Name,student,Z),LL),
	write(Name),write(' student : '),write(LL),nl.

f(X):-
	X=:=2,!,
	write('Give University'),nl,
	read(Uni),
	bagof(Y,kb(UniName,ece,Y),L),
	write(Name),write('ece : '),write(L),nl,
	bagof(Y,kb(UniName,maths,Y),L),
	write(Name),write('maths : '),write(L),nl,

f(X):-
	X=:=3,!,
	write('Give Dpt'),nl,
	read(Dpt),
	bagof(Y,kb(UniName,academicStaff,Y),LL),
	write(Name),write(' academicStaff : '),write(L),nl,
	bagof(Z,kb(Name,student,Z),LL),
	write(Name),write(' student : '),write(LL),nl.

f(X):-
	X=:=4,!,
	write('Give University and 2 ages'),nl,
	read(Uni),N1,N2,
	bagof((K,L,M),bagof(Y,kb(Uni,N1,N2),L,M),LLM),
	write(LL),nl.

f(X):-
	X=:=5,!,
	halt.
# ΒΗΤΑ

:- use_module(library(lists)).				% Required for using "delete"				

update_KB :-								
	['kb.pl'],								% Reads all clauses from the file and adds
											% them to the Knowledge Base
	write('Enter your selection: '), nl,
	write('1 for updating a record,'), nl,
	write('2 for creating a new record,'), nl,
	write('3 for deleting a record'), nl,
	read(X),
	command(X),
	X=<3, X>=1,								
	update_KB.
update_KB.

command(1):-								% Option 1: Update record
	change_record_KB,
	write_to_file.							% Write the updated list to the file.
command(2):-								% Option 1: Create record
	create_record_KB,
	write_to_file.
command(3):-								% Option 1: Delete record
	delete_record_KB,
	write_to_file.


create_record_KB:-
	write('Give the user`s info: '), nl,
	read(Clause),							

	students(Stud_L),						
	last(Stud_L,Max_ID),					
	New_ID is Max_ID+1,						
	assertz(student(New_ID,Clause)),		

	append(Stud_L,[New_ID],New_Stud_L),		
	retractall(students(_)),				
	asserta(students(New_Stud_L)),			% Add the new students(IDs) record to the KB

	retractall(max_student_id(_)),			% Remove the old Max student ID from the KB
	asserta(max_student_id(New_ID)).		% Add the new Max student ID to the KB


delete_record_KB:-							
	write('Give user`s ID: '), nl,
	read(ID),								
	retract(student(ID,_)),					% Deletes the record from the Knowledge Base

	students(Stud_L),						
	delete(Stud_L,ID,New_Stud_L),			
	retractall(students(_)),				% Remove the old students(IDs) record from the KB
	asserta(students(New_Stud_L)),			% Add the new students(IDs) record to the KB

	last(New_Stud_L,Max_ID),				
	retractall(max_student_id(_)),			% Remove the old Max student ID from the KB
	asserta(max_student_id(Max_ID)).		% Add the new Max student ID to the KB


change_record_KB:-							
	write('Give user`s ID: '), nl,
	read(ID),
	student(ID,Clause),						
	write('Current record: '),
	write(Clause), nl,
	write('Give new record`s values: '), nl,
	read(New_clause),						

	retract(student(ID,_)),					% Remove the old record from the KB
	assertz(student(ID,New_clause)).			% Add the new record to the Knowledge Base
			

write_to_file:-								% Writes a list to a file
	tell('kb.pl'),
	write(':- dynamic max_student_id/1, students/1, student/2.'), nl,
	listing(max_kb_id),
	listing(students),
	listing(student),
	told.