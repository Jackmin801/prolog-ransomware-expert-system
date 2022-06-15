time_to_scan :-
    check_last_full_scan,
    check_outdated_versions,
    nl.

good_full_scan_days(X) :-
    X < 7.

check_last_full_scan :-
    repeat,
    write('How many **days** has it been since your last full scan? [integer]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    not_integer(Select) ->
        error_msg(integer);
    good_full_scan_days(Select) -> 
        write('Great!'); 
        write('It is time for you to scan all your systems.')
    ),
    integer(Select), !,
    nl.

check_outdated_versions :-
    repeat,
    write('Are there any dependencies in your code that have outdated versions? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    not_bool(Select) ->
        error_msg(boolean);
    is_yes(Select) -> 
        write('Time to get on those updates!'); 
    is_no(Select) ->
        write('It is time for you to scan all your code.')
    ),
    is_bool(Select), !,
    nl.
