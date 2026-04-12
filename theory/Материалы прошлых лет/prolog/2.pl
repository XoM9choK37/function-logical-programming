md(N,X):- X is N mod 2.
itr(1,L):-append(1,L,L1),
print(L1).
itr(N,L):-N>1,
    (
    (md(N,Y),Y=0)->X is N div 2,append([N],L,L1),itr(X,L1);
    (md(N,Y),Y=1)->X is 3*N+1,append([N],L,L1),itr(X,L1)
).

rekyrs(2,[4|T]):-
        rekyrs(1,T).
    rekyrs(1,[1]).
    rekyrs(N,[H|T]):-
        M=N-1,rekyrs(M,T),
        T=[A|T1],T1=[B|_],
        H=3*A-B.


greatest_common_divisor(A, B, GCD):-
    AmB is A mod B,
    BmA is B mod A,
    (
      AmB == 0, !, GCD is B;
      BmA == 0, !, GCD is A;
      A > B, !, greatest_common_divisor(AmB, B, GCD);
      greatest_common_divisor(A, BmA, GCD)
    ).

divides(N,D) :-
    0 is N mod D.

divisors_0(N,D,R0,[D|R0]) :-
    divides(N,D).
divisors_0(N,D,R0,R0) :-
    \+ divides(N,D).

divisors(_,0,R,R).
divisors(N,D0,R0,R) :-
    divisors_0(N,D0,R0,R1),
    D is D0 - 1,
    divisors(N,D,R1,R).
divisors(X,R) :-
    X > 1,
    divisors(X,X,[],R), !.
