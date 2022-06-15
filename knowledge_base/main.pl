%==============
% Running loop
%--------------
start :- 
	write('Welcome to rEX, an expert system that protects you from ransomware.'),nl,
	write('How can I help you?'),nl,
	repeat,
	write('Enter a number for option:'),nl,
	write('1. How do I protect myself against ransomware?'),nl,
	write('2. Can you tell me more about ransomware?'),nl,
	write('>>> '),
	read(Select),nl,
	(event(Select) ->
	 	write('');
	 	write('Invalid option. Please specify one of the option shown.'),nl,nl
	),
	false,!,
	write('Thank you').

%================
% Event handlers
%----------------

% Cyber Hygiene
event(1) :-
    %write('The most common way that companies get hit by malware is when an employee\'s credentials are compromised.'),nl,
    %write('It it thus important that employees practice proper cyber hygiene and that they are given as less permissions as possible to perform their tasks.'),nl,
    nl,
	repeat,
	write('Enter a number for option:'),nl,
	write('1. Is my password good?'),nl,
	write('2. Should I install this app?'),nl,
	write('3. Should I trust this website?'),nl,
	write('4. Do my employees have too much access?'),nl,
	write('5. Is it time to backup my data?'),nl,
	write('6. Should I update or scan my system?'),nl,
	write('7. Is my code safe to commit?'),nl,
	write('8. Should I turn on my firewall?'),nl,
	write('9. We\'ve been hit by ransomware! What should we do?'),nl,
	write('10. I think I know enough. (Previous prompt)'),nl,
	write('>>> '),
	read(Select),nl,
	(hygiene_event(Select) ->
	 	write('');
	 	write('Invalid option. Please specify one of the option shown.'),nl,nl
	),
	(Select == 10 ->
	 	write('Ok. Great.'),nl;
	 	write('Anything else you want to know?'),nl
	),
	Select == 10,!.

% Ransomware Information
event(2) :-
	write('Sure! What would you like to know?'),nl,
	repeat,
	write('Enter a number for option:'),nl,
	write('1. What is ransomware?'),nl,
	write('2. Why does ransomware exist?'),nl,
	write('3. Who makes ransomware?'),nl,
	write('4. I think I know enough. (Previous prompt)'),nl,
	write('>>> '),
	read(Select),nl,
	(info_event(Select) ->
	 	write('');
	 	write('Invalid option. Please specify one of the option shown.'),nl,nl
	),
	(Select == 4 ->
	 	write('Ok. Great.'),nl;
	 	write('Anything else you want to know?'),nl
	),
	Select == 4, !.
