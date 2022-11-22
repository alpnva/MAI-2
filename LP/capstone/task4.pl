:-['task1.pl']

% son(parent, son)
son(A, B) :- 
    male(B), child(B, A).

% daughter(parent, daughter)
daughter(A, B) :- 
    female(B), child(B, A).

% mother (child, mother)
mother(A, B) :-
    female(B), child(A, B).

% father (child, father)
father(A, B) :-
    male(B), child(A, B).

% grandmother(person, grandmother)
grandmother(A, B) :- 
    child(A, C), mother(C, B).

% grandfather(person, grandfather)
grandfather(A, B) :- 
    child(A, C), father(C, B).

% brother(person, brother).
brother(A, B) :- 
    male(B), child(B, C), 
    child(A, C), A \= B.

% sister(person, sister).
sister(A, B) :- 
    female(B), child(B, C), 
    child(A, C), A \= B.

% wife(husband, wife)
wife(A, B) :-  
    male(A), female(B), 
    child(C, A), child(C, B).

% husband(wife, husband)
husband(A, B) :- wife(B, A).

% uncle(person, uncle)
uncle(A, B) :- 
    child(A, C), brother(C, B).

% aunt(person, aunt)
aunt(A, B) :- 
    child(A, C), sister(C, B).

% mother_in_law(man, his mother in law)
mother_in_law(A, B) :- 
    male(A), female(B), 
    wife(A, C), child(C, B).

% father_in_law(man, his father in law)
father_in_law(A, B) :- 
    male(A), female(B), 
    husband(A, C), child(C, B).

% cousin(person, cousin)
cousin(A, B) :- 
    uncle(A, C), child(B, C).
cousin(A, B) :- 
    aunt(A, C), child(B, C).

% grandson(person, grandson)
grandson(A, B) :-
    grandfather(B, A).

% grandson(person, granddaughter)
granddaughter(A, B) :-
    grandmother(B, A).
    
% движения для алгоритма поиска
move(X, Y, grandson) :- 
    grandson(X, Y).
move(X, Y, granddaughter) :- 
    granddaughter(X, Y).
move(X, Y, grandfather ):- 
    grandfather(X, Y).
move(X, Y, grandmother) :- 
    grandmother(X, Y).
move(X, Y, father_in_law) :- 
    father_in_law(X, Y).
move(X, Y, mother_in_law) :- 
    mother_in_law(X, Y).
move(X, Y, father):-
    father(X, Y).
move(X, Y, mother) :-
    mother(X, Y).
move(X, Y, son) :-
    son(X, Y).
move(X, Y, daughter) :-
    daughter(X, Y).
move(X, Y, brother) :-
    brother(X, Y).
move(X, Y, sister) :-
    sister(X, Y).
move(X, Y, husband) :- 
    husband(X, Y).
move(X, Y, wife):- 
    wife(X, Y).

% итерационный поиск
int(1).
int(M) :-
	int(N),
	M is N+1.

iter([Now|T1], Now, [Now|T1], [], 1). 
iter([Now|T1], Final, Way, [R|T2], N) :-
	N > 0,
	move(Now, New, R),
	not(member(New, [Now|T1])),
	N1 is N-1,
	iter([New, Now|T1], Final, Way, T2, N1).

iter_search(Start, Final, Way, R) :-
	int(M),
	(M > 50, !;	
    iter([Start], Final, Way, R, M)).


% Определение степени родства
relatives(A, B, Ans):-
	iter_search(A, B, _, Ans),!.
