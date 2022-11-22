% Task 2: Relational Data

% The line below imports the data
:- ['two.pl'].

sum([A|B], Sum) :- 
    sum(B, Sum1), Sum is A + Sum1.
sum([], 0).

% Средний балл по предмету
srball(A, Answ) :-
    findall(X, grade(_, _, A, X), B),
    sum(B, Sum), length(B, Len), Answ is Sum / Len.

% Распечатка среднего балла для предмета из списка
printsrball([A|B]) :-
    srball(A, X), write(A), write(': '), write(X), nl, printsrball(B).
printsrball([]).

%1) Напечатать средний балл для каждого предмета
task1() :-
    findall(A, grade(_, _, A, _), S1),
    setof(A, member(A, S1), S),
    printsrball(S).

% Число несдавших студентов в группе
failed(S, M) :-
    findall(A, grade(S, A, _, 2), L),
    length(L, M).

% Распечатка числа несдавших студентов для группы из списка
printfailed([A|X]) :-
    failed(A, B), write(A), write(': '), write(B), nl, printfailed(X).
printfailed([]).

%2) Для каждой группы, найти количество не сдавших студентов
task2() :-
    findall(A, grade(A, _, _, _), S1),
    setof(A, member(A, S1), S),
    printfailed(S).

% Число несдавших предмет студентов
failedsubj(S, M) :-
    findall(A, grade(_, A, S, 2), L),
    length(L, M).

% Распечатка числа несдавших студентов для предмета из списка
printfailedsubj([A|X]) :-
    failedsubj(A, B), write(A), write(': '), write(B), nl, printfailedsubj(X).
printfailedsubj([]).

%3) Найти количество не сдавших студентов для каждого из предметов
task3() :-
    findall(A, grade(_, _, A, _), S1),
    setof(A, member(A, S1), S),
    printfailedsubj(S).
