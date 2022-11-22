:-['task1.pl']

siblings(X, Y):-  % выясняем, являются ли родными братьями/сестрами
    child(X, Rod),
    child(Y, Rod),
    male(Rod), 
    X\=Y.

    
cousin(X, Y):- % проверка на двоюродного брата
    child(X, P),
    siblings(P, PP),
    child(Y, PP),
    male(Y).
