as yet unclassified
printOn: aStream

	self lastName ifNotEmpty: [ aStream nextPut: $" ].
	self name ifNotEmpty: [ aStream nextPutAll: self name ].
	self lastName ifNotEmpty: [ aStream nextPut: $" ].
	email ifNotNil: [ 
		self name ifNotEmpty: [ aStream nextPutAll: ' <' ].
		aStream nextPutAll: email.
		self name ifNotEmpty: [ aStream nextPut: $> ] ].