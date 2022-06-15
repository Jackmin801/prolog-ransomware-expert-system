check_password :-
    check_password_length,
    check_special_chars,
    check_password_contains_username,
    check_password_change_last_6_months.

check_password_length :-
    repeat,
    write('Is your password longers than 8 characters? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('You should probably make your passwords longer.');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_password_contains_username :-
    repeat,
    write('Does your password contain your username? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('You should not have your username in your password.'); 
    is_no(Select) ->
        write('Great!');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_password_change_last_6_months :-
    repeat,
    write('Have you changed your password in the last 6 months? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('You should probably change your password.');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_special_chars :-
    repeat,
    write('Does your password contain special characters? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('You should probably add special characters to your password.');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.
