common_port(20).
common_port(21).
common_port(22).
common_port(25).
common_port(53).
common_port(80).
common_port(123).
common_port(179).
common_port(443).
common_port(3389).
common_port(5432).
common_port(8080).
common_port(8443).
common_port(51820).


firewall_rules :-
    check_firewall_enable,
    check_common_ports,
    check_unused_ports,
    nl.

check_unused_ports :-
    repeat,
    write('Are you using all the ports you have allowed? [y/n]'), nl, nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('You should probably close the unused ports');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl, nl.


check_common_ports :-
    repeat,
    write('Are you exposing any common ports? (e.g. 22, 53, 80) [y/n]'), nl, nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('You should try to use uncommon ports if you can to prevent scanners from finding your endpoints.');
    is_no(Select) ->
        write('Great!'); 
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl, nl.


check_firewall_enable :-
    repeat,
    write('Is your firewall enabled? [y/n]'), nl, nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!');
    is_no(Select) ->
        write('You should enable your firewall to close ports by default.'); 
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl, nl.
