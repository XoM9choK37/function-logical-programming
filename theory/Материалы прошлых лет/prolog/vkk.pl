main :-
    solve(P),
	write(P).

solve(P) :-
      start(Start),
      search(Start,[Start],Q),
      reverse(Q,P).

search(S,P,P) :- goal(S), !.         /*цель*/
search(S,Visited,P) :-
     next_state(S,Nxt),              /*следующее состояние*/
     not(conflict(Nxt)),             /*безопасность*/
     loop(Nxt,Visited),           /*зацикленность*/
     search(Nxt,[Nxt|Visited],P).    /*поиск*/

loop(Nxt,Visited) :-
      not(member(Nxt,Visited)).

goal([0,0,0,0]).
start([1,1,1,1]).

next_state([1,G,C,1], [0,G,C,0]).	% забрать волка вправо
next_state([W,1,C,1], [W,0,C,0]).	% забрать козу вправо
next_state([W,G,1,1], [W,G,0,0]).	% забрать капусту вправо
next_state([W,G,C,1], [W,G,C,0]).	% фермер один едет вправо
next_state([W,G,C,0], [W,G,C,1]).	% фермер один едет влево
next_state([0,G,C,0], [1,G,C,1]).	% забрать волка влево
next_state([W,0,C,0], [W,1,C,1]).	% забрать козу влево
next_state([W,G,0,0], [W,G,1,1]).	% забрать капусту влево

conflict([1,1,_,0]).    % волк и коза слева, фермер справа
conflict([_,1,1,0]).	% коза и капуста слева, фермер справа
conflict([0,0,_,1]).	% волк и коза справа, фермер слева
conflict([_,0,0,1]).	% коза и капуста справа, фермер слева

