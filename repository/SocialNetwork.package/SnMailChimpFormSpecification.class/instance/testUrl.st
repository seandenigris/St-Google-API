as yet unclassified
testUrl

	| form |
	form := MailChimpForm new
		u: 'user';
		id: 'myID';
		email: 'me@myurl.com';
		firstName: 'Alan';
		lastName: 'Kay'.
	form url should equal: 'http://facebook.us11.list-manage.com/subscribe?MERGE1=Alan&u=user&MERGE2=Kay&id=myID&MERGE0=me@myurl.com' asUrl.