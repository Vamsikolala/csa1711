% Edges of the graph: edge(Start, End)
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(c, e).
edge(d, f).
edge(e, f).

% Heuristic values: h(Node, HeuristicValue)
h(a, 6).
h(b, 4).
h(c, 5).
h(d, 2).
h(e, 3).
h(f, 0).  % Goal node has heuristic 0

% Best-first search
best_first_search(Start, Goal, Path) :-
    bfs([[Start]], Goal, Path).

% If the head of the path is the goal, return the reversed path
bfs([[Goal|Rest]|_], Goal, Path) :-
    reverse([Goal|Rest], Path).

% Explore other paths
bfs([CurrentPath|OtherPaths], Goal, Path) :-
    CurrentPath = [CurrentNode|_],
    findall([NextNode|CurrentPath],
            (edge(CurrentNode, NextNode), \+ member(NextNode, CurrentPath)),
            NewPaths),
    append(OtherPaths, NewPaths, TempPaths),
    sort_paths_by_heuristic(TempPaths, SortedPaths),
    bfs(SortedPaths, Goal, Path).

% Sort paths based on heuristic of the head node
sort_paths_by_heuristic(Paths, Sorted) :-
    map_list_to_pairs(path_heuristic, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

% Helper to get heuristic value of head node of path
path_heuristic([Node|_], H) :- h(Node, H).
