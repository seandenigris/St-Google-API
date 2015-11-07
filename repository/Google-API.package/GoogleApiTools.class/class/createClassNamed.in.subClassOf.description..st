as yet unclassified
createClassNamed: aNameStringOrSymbol in: aCategoryString subClassOf: aClass description: aDescriptionString
	" create a GoogleApi class in the given category "
	
	| proxy desc cat cls |
	
	cat := aCategoryString.
	cat ifNil: [ cat := 'Google-API' ].
	cls := aClass.
	cls ifNil: [ cls := Object ].
	
	proxy := cls subclass: aNameStringOrSymbol asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: aCategoryString.
		
	desc := '*** automatically created by GoogleApiCreator ***', String cr.
	aDescriptionString ifNotNil: [ 
		desc := desc, String cr, aDescriptionString ].
	
	proxy classComment: desc.
	
	^ proxy
