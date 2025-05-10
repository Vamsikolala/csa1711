hanoi(1, A, C, _) :-
    format('Move disk from ~w to ~w~n', [A, C]).

hanoi(N, A, C, B) :-
    N > 1,
    M is N - 1,
    hanoi(M, A, B, C),
    hanoi(1, A, C, _),
    hanoi(M, B, C, A).
