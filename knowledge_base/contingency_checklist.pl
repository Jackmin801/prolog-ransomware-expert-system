contingency_checklist :-
    stay_calm,
    take_photo,
    disconnect_computer,
    reset_passwords,
    make_report,
    nl.

stay_calm :-
    repeat,
    write('Becoming the victim of ransomware can be a very stessful ordeal.'), nl, nl,
    write('However, it is important that you stay calm in this situation.'), nl, nl,
    write('Staying calm will help you to make the best choices in this situation.'), nl, nl,
    write('Are you able to keep calm? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Ok great. Lets get on with it.'), nl, nl; 
    is_no(Select) ->
        write('You should probably get a friend to help you. Make a call now.'), nl, nl;
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

take_photo :-
    repeat,
    write('You should take a photo of the ransomware note. Using another device (e.g. your phone).'), nl, nl,
    write('Have you taken a photo of the ransomware note? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Ok great.'); 
    is_no(Select) ->
        write('You should take a photo of the ransomware note as it is evidence for a police report.'), nl, nl,
        false;
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

disconnect_computer :-
    repeat,
    write('Are the affected hosts connected to the internet? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('You should disconnect them from the internet. Just in case there is a backdoor.'), nl, nl,
        false; 
    is_no(Select) ->
        write('Great!');
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

reset_passwords :-
    write('It is likely that your credentials have been compromised during the attack.'), nl, nl,
    write('You should change your passwords in order of importance.'), nl,
    reset_finance_pw,
    reset_work_pw,
    reset_socials_pw,
    reset_all_pw,
    nl.

reset_finance_pw :-
    repeat,
    write('Have you changed your passwords related to finances? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('You should change your passwords in case they were compromised in the attack.'), nl, nl,
        false;
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

reset_work_pw :-
    repeat,
    write('Have you changed your passwords related to work? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('You should change your passwords in case they were compromised in the attack.'), nl, nl,
        false;
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

reset_all_pw :-
    repeat,
    write('Have you changed the passwords on all the accounts you care about? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('You should change your passwords in case they were compromised in the attack.'), nl, nl,
        false;
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

reset_socials_pw :-
    repeat,
    write('Have you changed your passwords related to social media? [y/n]'), nl,
    write('>>> '),
    read(Select), nl,
    (
    is_yes(Select) -> 
        write('Great!'); 
    is_no(Select) ->
        write('You should change your passwords in case they were compromised in the attack.'), nl, nl,
        false;
        error_msg(boolean)
    ),
    is_bool(Select), !,
    nl.

make_report :-
    write('Ok. You should now report the incident.'), nl,
    write('If its a personal computer, you should report to the police.'), nl,
    write('If it is company property, you should report this to the cybersecurity team.'), nl,
    nl.
