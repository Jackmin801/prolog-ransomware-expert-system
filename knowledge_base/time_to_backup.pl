time_to_backup :-
    check_last_full_backup,
    check_last_code_backup,
    check_last_txn_backup,
    check_last_backup_test,
    nl.

good_full_backup_days(X) :-
    X < 7.

good_code_backup_hours(X) :-
    X < 12.

good_txn_backup_hours(X) :-
    X < 2.

good_backup_testing_days(X) :-
    X < 30.

check_last_full_backup :-
    repeat,
    write('How many **days** has it been since your last full backup? [integer]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    not_integer(Select) ->
        error_msg(integer);
    good_full_backup_days(Select) -> 
        write('Great!'); 
        write('It is time for you to backup all your data.')
    ),
    integer(Select), !,
    nl.

check_last_txn_backup :-
    repeat,
    write('How many **hours** has it been since your last transaction backup? [integer]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    not_integer(Select) ->
        error_msg(integer);
    good_txn_backup_hours(Select) -> 
        write('Great!'); 
        write('It is time for you to backup all your transactions.')
    ),
    integer(Select), !,
    nl.

check_last_code_backup :-
    repeat,
    write('How many **hours** has it been since your last code backup? [integer]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    not_integer(Select) ->
        error_msg(integer);
    good_code_backup_hours(Select) -> 
        write('Great!'); 
        write('It is time for you to backup all your code.')
    ),
    integer(Select), !,
    nl.

check_last_backup_test :-
    repeat,
    write('How many **days** has it been since you last tested the backups can restore your system? [integer]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    not_integer(Select) ->
        error_msg(integer);
    good_backup_testing_days(Select) -> 
        write('Great!'); 
        write('It is time to test your backups work!')
    ),
    integer(Select), !,
    nl.
