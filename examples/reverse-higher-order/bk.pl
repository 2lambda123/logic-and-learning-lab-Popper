tail([_|T],T).
head([H|_],H).
empty([]).
my_append(A,B,C):-
    append(A,[B],C).

fold(_P,Acc,[],Acc).
fold(P,Acc,[H|T],Out) :- call(P,Acc,H,Inter),fold(P,Inter,T,Out).
