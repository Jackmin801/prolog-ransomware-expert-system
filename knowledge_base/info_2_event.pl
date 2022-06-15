%================
% info_2_event
%----------------
% info_2_event(0).

% State actor? What is that?
info_2_event(1) :-
    write('A large amount of hackers are employed by governments and are acting on their behalf.'),nl,
    write('We refer to these hackers as state actors.'),nl,
    nl.

% What if the victims dont pay
info_2_event(2) :- info_1_event(2).

% Are there any examples?
info_2_event(3) :- info_1_event(3).

info_2_event(4).
