% Facts
fact(rain).
fact(cloudy).

% Rules
wet_ground :- fact(rain).
need_umbrella :- wet_ground.
