% Facts
can_fly(sparrow).
can_fly(eagle).
can_fly(parrot).

cannot_fly(penguin).
cannot_fly(ostrich).

% Rule to check and print flying ability
bird_fly_status(Bird) :-
    can_fly(Bird),
    write(Bird), write(' can fly.'), nl.

bird_fly_status(Bird) :-
    cannot_fly(Bird),
    write(Bird), write(' cannot fly.'), nl.

bird_fly_status(Bird) :-
    \+ can_fly(Bird),
    \+ cannot_fly(Bird),
    write('I do not know about '), write(Bird), write('.'), nl.
