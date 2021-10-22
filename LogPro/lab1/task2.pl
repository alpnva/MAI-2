% Task 2: Relational Data

% The line below imports the data
:- ['two.pl'].

%1) Напечатать средний балл для каждого предмета
task1() :-
    findall(X, grade(_, _, X, _), S1),
    setof(X, member(X, S1), S),
    printAvgList(S).

% Распечатка среднего балла для предмета из списка
printAvgList([X|T]) :-
    avgGrade(X, A), write(X), write(': '), write(A), nl, printAvgList(T).
printAvgList([]).

% Средний балл по предмету
avgGrade(Subj, Avg) :-
    findall(X, grade(_, _, Subj, X), L),
    sum(L, Sum), length(L, Len), Avg is Sum / Len.

sum([X|T], S) :- sum(T, S1), S is X + S1.
sum([], 0).

%2) Для каждой группы, найти количество не сдавших студентов
task2() :-
    findall(X, grade(X, _, _, _), G1),
    setof(X, member(X, G1), G),
    printFailList(G).

% Распечатка числа несдавших студентов для группы из списка
printFailList([X|T]) :-
    numFail(X, Y), write(X), write(': '), write(Y), nl, printFailList(T).
printFailList([]).

% Число несдавших студентов в группе
numFail(G, N) :-
    findall(X, grade(G, X, _, 2), L),
    length(L, N).

%3) Найти количество не сдавших студентов для каждого из предметов
task3() :-
    findall(X, grade(_, _, X, _), S1),
    setof(X, member(X, S1), S),
    printFailSubjList(S).

% Распечатка числа несдавших студентов для предмета из списка
printFailSubjList([X|T]) :-
    numFailSubj(X, Y), write(X), write(': '), write(Y), nl, printFailSubjList(T).
printFailSubjList([]).

% Число несдавших предмет студентов
numFailSubj(S, N) :-
    findall(X, grade(_, X, S, 2), L),
    length(L, N).
