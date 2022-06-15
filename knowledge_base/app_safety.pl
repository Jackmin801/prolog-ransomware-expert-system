reputable(google).
reputable(microsoft).
reputable(oracle).
reputable(hashicorp).
reputable(jetbrains).
reputable(firefox).
reputable(ethereum).
reputable(canonical).
reputable(docker).
reputable(kubernetes).
reputable(fsktm).
reputable(um).
reputable(ptm).
reputable(moh).
reputable(conda).
reputable(python).


app_safety :-
    check_link,
    check_reputable,
    check_https,
    check_cert,
    check_hashsum,
    nl.

check_reputable :-
    write('What company is the software from? (e.g. google, microsoft, oracle)'), nl,
    write('>>> '),
    read(Select), nl,
    (
    reputable(Select) -> 
        write('Great! That has historically been a repuable company.'); 
        write('We don\'t know that company, proceed with caution...')
    ),
    nl.

check_https :-
    repeat,
    write('Does the download site use https [y/n]'), nl,
    display_tip('Tip: Most browsers have a lock icon you next to the link when the site uses https. Some browsers will display an unsecure or even issue a warning if the site does not use https.'),
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('This is a rather big red flag. You SHOULD NOT proceed unless you personally know the authors of the software.');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_link :-
    repeat,
    write('Does the download site have weird mispellings in the link? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('BIG RED FLAG. This is a very common property of scam sites. DO NOT DOWNLOAD THIS SOFTWARE.');
    is_no(Select) ->
        write('Great!'); 
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_cert :-
    repeat,
    write('Does the download site have a proper ssl cert? [y/n]'), nl,
    display_tip('Tip: Most browsers have a lock icon you next to the link you can click to check ssl certs.'),
    write('     Make sure the exact company name and location is specified in the cert.'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('BIG RED FLAG. This is a very common property of scam sites. DO NOT DOWNLOAD THIS SOFTWARE.');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

check_hashsum :-
    repeat,
    write('Is the hashum of the install correct?'), nl,
    display_tip('You can google how to check hashsum for your specific operating system.'),
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('BIG RED FLAG. This is a very common property of scam sites. DO NOT DOWNLOAD THIS SOFTWARE.');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.
