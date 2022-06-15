is_bool(y).
is_bool(ya).
is_bool(ye).
is_bool(yes).
is_bool(n).
is_bool(no).
is_bool(tak).
is_bool(tidak).
is_bool(x).
is_bool(yup).
is_bool(nope).

is_yes(y).
is_yes(ya).
is_yes(ye).
is_yes(yes).
is_yes(yup).

is_no(n).
is_no(no).
is_no(tak).
is_no(tidak).
is_no(x).
is_no(nope).

not_integer(X) :-
    \+ integer(X).

not_bool(X) :-
    \+ is_bool(X).
