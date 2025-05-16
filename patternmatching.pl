% Pattern matching with list
match_list([H|T]) :-
    write('Head: '), write(H), nl,
    write('Tail: '), write(T), nl.

% Pattern matching with structure
match_person(person(Name, Age)) :-
    write('Name: '), write(Name), nl,
    write('Age: '), write(Age), nl.
