man(vova).
man(vitya).
man(vitya2).
man(vitya3).
woman(nina).
woman(lena).
parent(vova,nina).
parent(vova,vitya).
parent(vova,vitya2).
men():- man(X),print(X),nl,fail.
women():- woman(X),print(X),nl,fail.
children(X):- parent(X,Y),print(Y),nl,fail.
mother(X,Y):-woman(X),parent(X,Y).
father(X,Y):-man(X),parent(X,Y).
brother(X,Y):-man(X),parent(Z,X),parent(Z,Y).
max(X,Y,X):- X>Y,!.
max(_,Y,Y).

fact(0,1).
fact(N,X):- N>0,
    N1 is  N-1,
    fact(N1,X1),
    X is X1*N.

fact2(0,X,X).
fact2(N,A,X):- N>0,
    N1 is N-1,
    A1 is A*N,
    fact2(N1,A1,X1),
    X is X1.
call_fact2(N,X):-fact2(N,1,X).

%chain(+N,-L)
chain(N,L) :- chain(N,0,L).
chain(1,L,L):-!.
chain(N,CurL,L) :- 0 is N mod 2,!, NewN is N div 2,
    NewL is CurL + 1, chain(NewN,NewL,L).
chain(N,CurL,L) :- NewN is 3*N + 1, NewL is CurL + 1,
    chain(NewN,NewL,L).

maxChain(NMaxChain) :- maxChain(1,0,1,NMaxChain).
maxChain(1000000,_,NMaxChain,NMaxChain) :- !.
maxChain(N,CurChain,_,NMaxChain) :- chain(N,L),
    L > CurChain, !, NewN is N + 1, maxChain(NewN,L,N,NMaxChain).
maxChain(N,CurChain,CurN,NMaxChain) :- NewN is N + 1,
    maxChain(NewN,CurChain,CurN,NMaxChain).

%read_list(+N,-List)
read_list(0,[]):-!.
read_list(N,[Head|Tail]) :- read(Head), NewN is N - 1,
    read_list(NewN,Tail).

write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

concat1([],List,List).
concat1([H|T],List,[H|Tail]) :- concat(T,List,Tail).

sum_list_down(List,Sum) :- sum_list_down(List,0,Sum).
sum_list_down([],CurSum,CurSum):-!.
sum_list_down([H|T],CurSum,Sum) :- NewSum is CurSum + H,
    sum_list_down(T,NewSum,Sum).

sum_list_up([],0):-!.
sum_list_up([H|T],Sum) :- sum_list_up(T,SumTail), Sum is SumTail + H.


list_el_numb(List,El,Numb) :- list_el_numb(List,El,Numb,1).
list_el_numb([],_,_,_) :- !,fail.
list_el_numb([El|_],El,Numb,Numb).
list_el_numb([_|T],El,Numb,Ind) :- NewInd is Ind + 1,
    list_el_numb(T,El,Numb,NewInd).


list :- list_el_numb([5,6,7],El,N), write(El),write(' '),write(N),nl,fail.


