% Initial facts
fact(a).
fact(b).

% Rules: infer new facts from existing ones
forward :-
    (fact(a), fact(b), \+ fact(c) -> assertz(fact(c)), write('Derived: c'), nl ; true),
    (fact(c), \+ fact(d) -> assertz(fact(d)), write('Derived: d'), nl ; true),
    write('Forward chaining complete.').

% Check what was inferred
check :-
    fact(X),
    write('Known fact: '), write(X), nl,
    fail.
check.
