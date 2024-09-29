as yet unclassified
displayStringOn: aStream

	self title ifNotNil: [ :ttl | aStream << ttl ].
	self version ifNotNil: [ :v | aStream << ' (' << v << ')' ].
	self isPreferred ifTrue: [ aStream << '*' ]