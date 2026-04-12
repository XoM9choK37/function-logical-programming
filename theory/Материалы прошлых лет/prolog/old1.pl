woman(katrin).
woman(sofia).
woman(mary).
woman(anna).
man(sergey).
man(daniel).
man(petr).
man(ivan).
parent(anna,ivan).
parent(ivan,katrin).
parent(sergey,sofia).
parent(sergey,daniel).
parent(katrin,daniel).
parent(daniel,mary).
parent(daniel,petr).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

relative(X,Y) :- ancestor(Z,X), ancestor(Z,Y), X\=Y.

mother(X, Y) :-
        woman(X),
        parent(X, Y).
father(X, Y) :-
        man(X),
        parent(X,Y).
daughter(X, Y) :-
        parent(Y, X),
        woman(X).
son(X, Y) :-
        parent(Y,X),
        man(X).
sister(X, Y) :-
        woman(X),
        parent(Q,X),
        parent(Q,Y),
        X\=Y.
brother(X, Y) :-
        man(X),
        parent(Q,X),
        parent(Q,Y),
        X\=Y.
sibling(X, Y) :-
        parent(Q,X),
        parent(Q,Y),
        X\=Y.
uncle(X, Y) :-
        parent(P,Y),
        brother(X,P).
aunt(X, Y) :-
        parent(P,Y),
        sister(X,P).
gmother(X,Y) :-
        parent(P,Y),
        parent(X,P),
        woman(X).
gfather(X,Y) :-
        parent(P,Y),
        parent(X,P),
        man(X).


