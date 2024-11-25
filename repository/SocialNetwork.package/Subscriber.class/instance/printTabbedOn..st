as yet unclassified
printTabbedOn: aStream 

	aStream
			nextPutAll: self firstName;
			tab;
			nextPutAll: self lastName;
			tab;
			nextPutAll: self email;
			crlf