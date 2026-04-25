cifr_sum(0,0):-!.
cifr_sum(N,S):-N1 is N div 10,cifr_sum(N1,S1),S is S1 + N mod 10.

cifr_sum_down(N,S):-cifr_sum_down(N,S,0).
cifr_sum_down(0,S,S):-!.
cifr_sum_down(N,S,X):-X1 is X + N mod 10,N1 is N div 10,cifr_sum_down(N1,S,X1).

rm_cif([],[],_):-!.
rm_cif([H|T],X,N):-cifr_sum(H,S),S is N,rm_cif(T,X,N).
rm_cif([H|X],[H|Y],N):-cifr_sum(H,S),not(S is N),rm_cif(X,Y,N).


