% Facts: gender
male(john).
male(mike).
male(steve).
male(david).

female(linda).
female(susan).
female(emma).
female(anna).

% Facts: parent(child, parent)
parent(mike, john).      % Mike is the child of John
parent(mike, linda).     % Mike is the child of Linda
parent(steve, john).
parent(steve, linda).
parent(david, mike).
parent(emma, mike).
parent(anna, steve).
parent(anna, susan).

% Rules
father(Child, Father) :-
    parent(Child, Father),
    male(Father).

mother(Child, Mother) :-
    parent(Child, Mother),
    female(Mother).

grandparent(Child, Grandparent) :-
    parent(Child, Parent),
    parent(Parent, Grandparent).

sibling(X, Y) :-
    parent(X, P),
    parent(Y, P),
    X \= Y.

brother(X, Y) :-
    sibling(X, Y),
    male(X).

sister(X, Y) :-
    sibling(X, Y),
    female(X).
