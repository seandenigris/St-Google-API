as yet unclassified
testPrintWithLastName
	| person |
	person := Subscriber new
		email: 'me@myurl.com';
		name: 'Sean D';
		yourself.
	person printString should equal: '"Sean D" <me@myurl.com>'