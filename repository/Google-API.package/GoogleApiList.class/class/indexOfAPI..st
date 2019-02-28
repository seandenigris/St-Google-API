accessing
indexOfAPI: anAPI
	^ APIList
		indexOf: anAPI
		ifAbsent: [ APIList size > 0
				ifTrue: [ 1 ]
				ifFalse: [ 0 ] ]