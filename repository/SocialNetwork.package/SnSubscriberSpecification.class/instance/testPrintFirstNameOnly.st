as yet unclassified
testPrintFirstNameOnly
	| person |
	person := Subscriber new
		email: 'me@myurl.com';
		name: 'Sean';
		yourself.
	person printString should equal: 'Sean <me@myurl.com>'