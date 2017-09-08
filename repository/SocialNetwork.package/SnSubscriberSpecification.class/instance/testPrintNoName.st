as yet unclassified
testPrintNoName
	| person |
	person := Subscriber new
		email: 'me@myurl.com';
		yourself.
	person printString should equal: 'me@myurl.com'