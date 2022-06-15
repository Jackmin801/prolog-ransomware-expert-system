code_safety :-
    check_env_file,
    check_access_keys,
    check_hardcode_password,
    nl.


check_env_file :-
    repeat,
    write('Does your commit contain an env file? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('You probably should not be commiting your env file'); 
    is_no(Select) ->
        write('Great!');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_access_keys :-
    repeat,
    write('Does commit contain hardcoded access keys? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('You should not commit your access keys to the code repository.'); 
    is_no(Select) ->
        write('Great!');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_hardcode_password :-
    repeat,
    write('Does your commit contain hardcoded passwords? [y/n]'), nl, nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('You probably should not be commiting your passwords!'); 
    is_no(Select) ->
        write('Great!');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.
