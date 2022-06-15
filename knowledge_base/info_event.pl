%================
% Info Event handlers
%----------------
% What is ransomware?
info_event(1) :-
    write('Ransomware is a type of malware from cryptovirology that threatens to publish the victim\'s personal data or perpetually block access to it unless a ransom is paid.'),nl,
    nl,
	repeat,
	write('Enter a number for option:'),nl,
	write('1. Cryptovirology? What is that?'),nl,
	write('2. What if the victims don\'t pay?'),nl,
	write('3. Are there any examples?'),nl,
	write('4. Ah, ok. (Previous prompt)'),nl,
	write('>>> '),
	read(Select),nl,
	(info_1_event(Select) ->
	 	write('');
	 	write('Invalid option. Please specify one of the option shown.'),nl,nl
	),
	(Select == 4 ->
	 	write('Ok. Great.'),nl;
	 	write('Anything else you want to know?'),nl
	),
	Select == 4,!,
    nl.

% Why does ransomware exist?
info_event(2) :-
    write('Usually, cybercriminals use ransomware to earn money from victims. Sometimes, state actors will use ransomware just to cripple a service.'),nl,
    nl,
	repeat,
	write('Enter a number for option:'),nl,
	write('1. State actors? What is that?'),nl,
	write('2. What if the victims don\'t pay?'),nl,
	write('3. Are there any examples?'),nl,
	write('4. Ah, ok. (Previous prompt)'),nl,
	write('>>> '),
	read(Select),nl,
	(info_2_event(Select) ->
	 	write('');
	 	write('Invalid option. Please specify one of the option shown.'),nl,nl
	),
	(Select == 4 ->
	 	write('Ok. Great.'),nl;
	 	write('Anything else you want to know?'),nl
	),
	Select == 4,!,
    nl.

% Who makes ransomware?
info_event(3) :-
    write('Ransomware is usually created by malicious programmers with knowledge of cybersecurity.'),nl,
    nl,
	repeat,
	write('Enter a number for option:'),nl,
	write('1. Are there any examples?'),nl,
	write('2. Ah, ok. (Previous prompt)'),nl,
	write('>>> '),
	read(Select),nl,
	(info_3_event(Select) ->
	 	write('');
	 	write('Invalid option. Please specify one of the option shown.'),nl,nl
	),
	(Select == 2 ->
	 	write('Ok. Great.'),nl;
	 	write('Anything else you want to know?'),nl
	),
	Select == 2,!,
    nl.

info_event(4).
