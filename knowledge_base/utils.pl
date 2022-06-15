display_tip(Tip) :-
    write('Tip: '),
    write(Tip),
    nl.

in_choice_bound(X, Bound) :-
    integer(X),
    X > 0,
    X < Bound + 1.
