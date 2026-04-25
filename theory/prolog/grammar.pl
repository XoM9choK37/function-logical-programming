%sentence([он,подарил,ей,его,книгу,вчера],[]).

sentence --> pronoun(P),
	         verb(P),
			 pronoun_second(P),
	         addition(P),
             adverb.
		
pronoun(P) --> actor(P).

actor --> [A],{actor(A)}.
actor(m) --> [он].
actor(f) --> [она].


verb(P) --> action(P).

action --> [ACT],{action(ACT)}.
action(m) --> [показал].
action(f) --> [показала].
action(m) --> [подарил].
action(f) --> [подарила].

pronoun_second(P) --> to_who(P).
to_who(m) --> [ей].
to_who(f) --> [ему].

addition(P) --> pronoun_third(P, G), thing(G).

pronoun_third --> [PR,G], {pronoun_third(PR, G)}.
pronoun_third(m, g) --> [его].
pronoun_third(f, g) --> [ее].
pronoun_third(f, k) --> [].
pronoun_third(m, k) --> [].

thing --> [G],{thing(G)}.
thing(g) --> [книгу].
thing(k) --> [подарок].
thing(g) --> [шарф].

adverb --> day.

day --> [вчера].
day --> [сегодня].


