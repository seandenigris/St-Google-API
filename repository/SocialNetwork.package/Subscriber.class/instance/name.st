accessing
name
	| result |
	result := self firstName.
	self lastName ifNotEmpty: [ :ln | result := result, ' ', ln ].
	^ result