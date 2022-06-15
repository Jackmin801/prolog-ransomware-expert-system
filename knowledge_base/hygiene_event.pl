%================
% Hygiene Event handlers
%----------------
hygiene_event(0).

% Is my password good?
hygiene_event(1) :-
    check_password,
    nl.

% Should I install this app?
hygiene_event(2) :-
    app_safety,
    nl.

% Should I trust this website?
hygiene_event(3) :-
    site_safety,
    nl.

% Do my employees have too much access?
hygiene_event(4) :-
    acl,
    nl.

% Is it time to backup my data?
hygiene_event(5) :-
    time_to_backup,
    nl.

% Should I update or scan my system?
hygiene_event(6) :-
    time_to_scan,
    nl.

% Is my code safe to commit?
hygiene_event(7) :-
    code_safety,
    nl.

% Should I turn on my firewall?
hygiene_event(8) :-
    firewall_rules,
    nl.

% Weve been hit by ransomware! What should we do?
hygiene_event(9) :-
    contingency_checklist,
    nl.

hygiene_event(10).
