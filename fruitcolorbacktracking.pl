% Facts: fruit(name, color)
fruit(apple, red).
fruit(banana, yellow).
fruit(grape, purple).
fruit(orange, orange).
fruit(kiwi, green).
fruit(blueberry, blue).

% Rule to find fruit by color
fruit_by_color(Color, Fruit) :-
    fruit(Fruit, Color).
