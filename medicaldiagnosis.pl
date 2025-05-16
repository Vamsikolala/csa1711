% Facts: disease(Disease, Symptom)
disease(flu, fever).
disease(flu, cough).
disease(flu, sore_throat).

disease(cold, sneezing).
disease(cold, runny_nose).
disease(cold, sore_throat).

disease(covid19, fever).
disease(covid19, cough).
disease(covid19, tiredness).

% Rule: check if all symptoms match
has_disease(D) :-
    disease(D, S1), symptom(S1),
    disease(D, S2), symptom(S2),
    disease(D, S3), symptom(S3),
    S1 \= S2, S2 \= S3, S1 \= S3,
    write('You may have: '), write(D), nl.

% Example: Input symptoms
symptom(fever).
symptom(cough).
symptom(sore_throat).
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
