acl :-
    check_last_access,
    check_time_limits,
    check_vendor_access,
    nl.

check_last_access :-
    repeat,
    write('Have your employees used the actions in this policy in the last 90 days? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('They probably do not need this access for their work. You should revoke their access.');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_time_limits :-
    repeat,
    write('Do roles that have production critical operations have time limits? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('You should set time limits on production critical operation roles to limit the time in which your system is vulnerable.');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_vendor_access :-
    repeat,
    write('Can your 3rd party vendors make changes that would disrupt the operation of your system without you being alerted? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('You should restrict the access of your vendors such that they require your approval or at least alert you if they make any production critical changes.'); 
    is_no(Select) ->
        write('Great!');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.
