accessing
detectNamed: aString
	^ self chart detect: [ :e | e nickname = aString ]