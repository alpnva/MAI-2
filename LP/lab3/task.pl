% Предикат добавления элемента к списку.
append([], X, X).
append([A|B], X, [A|C]) :- 
    append(B, X, C).

% Предикаты различных ситуаций.
change(X,Y) :- 
    append(Head, ['_','w'|Tail], X), append(Head, ['w','_'|Tail], Y).
change(X,Y) :- 
    append(Head, ['w','_'|Tail], X), append(Head, ['_','w'|Tail], Y).
change(X,Y) :- 
    append(Head, ['_','b'|Tail], X), append(Head, ['b','_'|Tail], Y).
change(X,Y) :- 
    append(Head, ['b','_'|Tail], X), append(Head, ['_','b'|Tail], Y).
change(X,Y) :- 
    append(Head, ['_','b','w'|Tail], X), append(Head, ['w','b','_'|Tail], Y).
change(X,Y) :- 
    append(Head, ['_','w','b'|Tail], X), append(Head, ['b','w','_'|Tail], Y).
change(X,Y) :- 
    append(Head, ['b','w','_'|Tail], X), append(Head, ['_','w','b'|Tail], Y).
change(X,Y) :- 
    append(Head, ['w','b','_'|Tail], X), append(Head, ['_','b','w'|Tail], Y).

prolonged([A|Y], [B,A|Y]) :- 
    change(A, B), 
    not(member(B, [A|Y])).

% Распечатка результата.
print([_]).
print([X|Y]) :- 
    print(Y), nl, write(X).

% Поиск в ширину.
search_in_width(A, B) :- 
    write(A), width([[A]], B, C), print(C), !.
width([[X|Y]|_], X, [X|Y]).
width([X|Y], A, C) :- 
    findall(D, prolonged(X, D), B), append(Y, B, F), !, width(F, A, C).
width([_,Y], A, B) :- 
    width(Y, A, B).

% Поиск в глубину.
search_in_depth(A, B) :- 
    write(A), depth([[A]], B, C), print(C), !.
depth([[X|Y]|_], X, [X|Y]).
depth([X|Y], A, C) :- 
    findall(D, prolonged(X, D), B), append(B, Y, F), !, depth(F, A, C).
depth([_,Y], A, B) :- 
    depth(Y, A, B).

% Поиск в глубину с итеративным погружением.
solve(A, B, C, D) :- 
    solve_depth([A], B, C, D).
solve_depth([X|Y], X, [X|Y], 0).
solve_depth(C, A, B, M) :- 
    M>0, prolonged(C, N), M1 is M-1, solve_depth(N, A, B, M1).
solve(A, B, C) :- 
    int(Num), solve(A, B, C, Num).
solve(A, B) :- 
    write(A), solve(A, B, C), print(C), !.
int(1).
int(M) :- 
    int(M1), M is M1+1.
