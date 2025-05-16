% Initial state: monkey at door, box at window, monkey on floor, no banana
initial_state(state(at(door), at(window), on_floor, has_not_banana)).

% Goal state: monkey has banana
goal_state(state(_, _, on_box, has_banana)).

% Actions
move(state(at(_), Box, on_floor, Banana), at(X), state(at(X), Box, on_floor, Banana)).
push(state(at(X), at(X), on_floor, Banana), at(Y), state(at(Y), at(Y), on_floor, Banana)).
climb(state(Pos, Pos, on_floor, Banana), state(Pos, Pos, on_box, Banana)).
grab(state(Pos, Pos, on_box, has_not_banana), state(Pos, Pos, on_box, has_banana)).

% Path to goal
can_get_banana :-
    initial_state(Initial),
    goal_state(Goal),
    path(Initial, Goal, []).

% Try actions recursively
path(State, State, _) :-
    write('Monkey got the banana!'), nl.

path(Current, Goal, Visited) :-
    move(Current, NewPos, Next),
    \+ member(Next, Visited),
    write('Monkey moves to '), write(NewPos), nl,
    path(Next, Goal, [Next|Visited]).

path(Current, Goal, Visited) :-
    push(Current, NewPos, Next),
    \+ member(Next, Visited),
    write('Monkey pushes box to '), write(NewPos), nl,
    path(Next, Goal, [Next|Visited]).

path(Current, Goal, Visited) :-
    climb(Current, Next),
    \+ member(Next, Visited),
    write('Monkey climbs on box'), nl,
    path(Next, Goal, [Next|Visited]).

path(Current, Goal, Visited) :-
    grab(Current, Next),
    \+ member(Next, Visited),
    write('Monkey grabs the banana'), nl,
    path(Next, Goal, [Next|Visited]).
