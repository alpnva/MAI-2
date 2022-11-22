% Place your solution here
% Левин, Митерев и Набатов работают в банке в качестве бухгалтера, кассира и счетовода.
person('Levin').
person('Miterev').
person('Nabatov').

work('bukhgalter').
work('cassir').
work('schetovod').


% Если Набатов кассир, то Митерев счетовод. 
% Если Набатов счетовод, то Митерев бухгалтер. 
% Если Митерев не кассир, то Левин не счетовод. 
% Если Левин бухгалтер, то Набатов счетовод.
conditions('Nabatov',A,'Miterev',B,'Levin',C):- % здесь отсечение играет роль предиката 'если , то '
(A='cassir',!,B='schetovod');
(A='schetovod',!,B='bukhgalter');
(B\='cassir',!,C\='schetovod');
(C='bukhgalter',!,A='schetovod').
	
solution(Answer):-
Answer=[[Person1,Work1],[Person2,Work2],[Person3,Work3]],
person(Person1),
person(Person2),
person(Person3),
	
Person1\=Person2,Person2\=Person3,Person3\=Person1,
	
work(Work1),
work(Work2),
work(Work3),
	
Work1\=Work2,Work2\=Work3,Work3\=Work1,
	
conditions(Person1,Work1,Person2,Work2,Person3,Work3),!.
