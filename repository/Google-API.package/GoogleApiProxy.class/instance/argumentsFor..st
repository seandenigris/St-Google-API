utilities
argumentsFor: aMethodContext
	| temps arguments |
	
	arguments := Dictionary new.
	temps := aMethodContext tempNames.
	1 to: temps size do: [ :i | 
		arguments at: ( temps at: i ) put: ( aMethodContext tempAt: i ) ].
		
	^ arguments
	