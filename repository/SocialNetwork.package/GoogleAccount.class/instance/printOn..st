accessing
printOn: aStream

	nickname ifNotNil: [ aStream nextPutAll: self nickname ].
	email ifNotNil: [ aStream space; nextPutAll: self email ].