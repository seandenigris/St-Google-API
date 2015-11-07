as yet unclassified
createSourceFromMethodDef: methodDef named: methodName
	| selector selector2 comment methodComment paramComment source source2 pathVar actionVar 
		paramDef isFirstParam isOptional isUpload uploadDef maxUpload acceptedMimes uploadProt 
		uploadProtSimple uploadPathSimple uploadProtResumable uploadPathResumable |
	
	( methodDef isKindOf: Dictionary )
		ifFalse: [ ^nil ].
	
	selector := methodName.
	methodComment := methodDef at: 'description' ifAbsent: [ ].	
	pathVar := ( methodDef at: 'path' ifAbsent: [ '' ] ) asString.
	actionVar := ( methodDef at: 'httpMethod' ifAbsent: [ 'GET' ] ) asString asUppercase.
	isUpload := ( methodDef at: 'supportsMediaUpload' ifAbsent: [ false ] ).
	uploadDef := ( methodDef at: 'mediaUpload' ifAbsent: [ Dictionary new ] ).
	maxUpload := ( uploadDef at: 'maxSize' ifAbsent: [ 0 ] ).
	acceptedMimes := ( uploadDef at: 'accept' ifAbsent: [ #('*/*') ] ).
	uploadProt := ( uploadDef at: 'protocols' ifAbsent: [ Dictionary new ] ).
	uploadProtSimple := ( uploadProt at: 'simple' ifAbsent: [ Dictionary new ] ).
	uploadPathSimple := ( uploadProtSimple at: 'path' ifAbsent: [ nil ] ).
	uploadProtResumable := ( uploadProt at: 'resumable' ifAbsent: [ Dictionary new ] ).
	uploadPathResumable := ( uploadProtResumable at: 'path' ifAbsent: [ nil ] ).
	
	" cycle through params to construct selector "
	isFirstParam := true.
	isOptional := false.

	paramDef := methodDef at: 'parameters' ifAbsent: [ ].	
	( paramDef isKindOf: Dictionary ) ifTrue: [
		
		( paramDef size > 0 ) ifTrue: [			
			paramComment := String tab, String tab, 
				'Parameters, * = required, optional parameters in optionsDict', 
				String cr, String cr ].
		
		paramDef keysAndValuesDo: [ :pName :pDef || pNameNorm pType pReq pDesc |
			
			" create a parameter description comment "
			pNameNorm := pName uncapitalized.
			pType := ( pDef at: 'type' ifAbsent: [ '' ] ) asString capitalized.
			pDesc := pDef at: 'description' ifAbsent: [ '' ].
			pReq := pDef at: 'required' ifAbsent: [ false ].
			pReq ifFalse: [ isOptional := true ].

			paramComment := paramComment, String tab, String tab, pNameNorm.
			( pType size > 0 ) ifTrue: [ 
				paramComment := paramComment, ' (', pType.
				pReq ifTrue: [ paramComment := paramComment, '*' ].
				paramComment := paramComment, ')' ].
			
			paramComment := paramComment, ': ', pDesc, String cr.

			pReq ifTrue: [
				( isFirstParam )
					ifTrue: [
						isFirstParam := false.
						selector := selector, ': ', pNameNorm, ' ' ]
					ifFalse: [
						selector := selector, pNameNorm, ': ', pNameNorm, ' ' ] 
			]
		]
	].

	" non required parameters are handled via a dictionary parameter "
	selector2 := selector.
	isOptional ifTrue: [
		( isFirstParam )
			ifTrue: [ selector := selector, ': optionsDict' ]
			ifFalse: [ selector := selector, 'options: optionsDict' ].
	].

	" build method comment "
	comment := ''.	
	methodComment ifNotNil: [
		comment := String tab, String tab, methodComment, String cr ].
	paramComment ifNotNil: [ 
		( comment size > 0 ) ifTrue: [
			comment := comment, String cr ].
		comment := comment, paramComment ].
	comment := comment copyWithRegex: '"' matchesReplacedWith: '""'.
	( comment size > 0 ) ifTrue: [
		comment := String tab, '"', String cr, comment, String tab, '"', String cr, String cr ].	
	
	" create code for main method "
	source := WriteStream on: ( String new ).
	isUpload
		ifTrue: [
			source
				<< ( selector, String cr );
				<< ( comment );
				<< ( String tab, '| action path values |', String cr, String cr );
				<< ( String tab, 'action := #', actionVar, '.', String cr );
				<< ( String tab, 'values := self argumentsFor: thisContext.', String cr );
				<< ( String tab, 'path := self rootPath, ( self ', 
					String cr, String tab, String tab,
						'replacePlaceholdersIn: ''', uploadPathSimple, ''' with: values ).', String cr, String cr );
				<< ( String tab, '^ self makeRequestTo: path usingMethod: action with: ' ) ]
		ifFalse: [
			source
				<< ( selector, String cr );
				<< ( comment );
				<< ( String tab, '| action path values |', String cr, String cr );
				<< ( String tab, 'action := #', actionVar, '.', String cr );
				<< ( String tab, 'values := self argumentsFor: thisContext.', String cr );
				<< ( String tab, 'path := self basePath, ( self ', 
					String cr, String tab, String tab,
						'replacePlaceholdersIn: ''', pathVar, ''' with: values ).', String cr, String cr );
				<< ( String tab, '^ self makeRequestTo: path usingMethod: action with: ' ) ].
		
	isOptional
		ifTrue: [ source << 'optionsDict.' ]
		ifFalse: [ source << 'nil.' ].
		
	" create convinience method "
	isOptional ifTrue: [
		source2 := WriteStream on: ( String new ).
		source2
			<< ( selector2, String cr, String cr );
			<< ( String tab, '^ self ', selector2 ).
			
		( isFirstParam )
			ifFalse: [ source2 << 'options' ].
			
		source2 << ( ': ( Dictionary new )', String cr ).
	].

	source := source contents.
	source2 
		ifNotNil: [ source2 := source2 contents ]
		ifNil: [ source2 := nil ].
	
	^ { source. source2 }.
	
