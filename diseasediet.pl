% Facts: disease and recommended diet
diet_for(diabetes, [vegetables, whole_grains, lean_protein, nuts]).
diet_for(hypertension, [low_salt_foods, fruits, vegetables, whole_grains]).
diet_for(anemia, [spinach, red_meat, lentils, iron_supplements]).
diet_for(obesity, [low_calorie_foods, fruits, salads, boiled_vegetables]).
diet_for(heart_disease, [oats, olive_oil, fish, vegetables, fruits]).
diet_for(gastric_ulcer, [banana, rice, milk, yogurt, boiled_foods]).

% Rule to suggest diet
suggest_diet(Disease) :-
    diet_for(Disease, DietList),
    write('Recommended diet for '), write(Disease), write(': '), nl,
    write_list(DietList).

% Helper rule to print list items
write_list([]).
write_list([H|T]) :-
    write('- '), write(H), nl,
    write_list(T).
