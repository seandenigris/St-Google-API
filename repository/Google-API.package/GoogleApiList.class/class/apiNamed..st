accessing
apiNamed: anAPIName
	^ self
		apiAt: (APINameList  indexOf: anAPIName ifAbsent: [ GoogleApiError signal: 'No API named ' , anAPIName ])