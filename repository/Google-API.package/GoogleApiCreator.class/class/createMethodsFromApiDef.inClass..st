as yet unclassified
createMethodsFromApiDef: apiDef inClass: aClass
	| methods cnt |
	
	( apiDef isKindOf: Dictionary )
		ifFalse: [ ^nil ].
		
	methods := apiDef at: 'methods' ifAbsent: [ ^nil ].	
		
	cnt := 0.
	UIManager default informUserDuring: [ :bar |
	bar label: 'generate methods in (', aClass name, ')'.
	
	methods keysAndValuesDo: [ :metName :metDef |
		cnt := cnt + 1.
		bar current: cnt.
		
		self 
			createMethodFromMethodDef: metDef 
			inClass: aClass
			named: metName ] ]
