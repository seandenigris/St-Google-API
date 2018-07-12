as yet unclassified
readApiDef: aUrl
	| apiDef apiDefObj |
	
	apiNameList := OrderedCollection new.
	apiList := {}.
		
	[ apiDef := ZnEasy get: aUrl.
		( apiDef entity isKindOf: ZnStringEntity ) ifFalse: [
			self error: 'Invalid content received' ] 
	] on: Error do: [ :ex || msg |
		msg := ( ex messageText = String empty )
				ifTrue: [ ex asString ]
				ifFalse: [ ex messageText ].
		self abort: msg title: 'Unable to discover API'.
		 ^ nil ].
	
	( ( apiDef statusLine code < 200 ) or: [ apiDef statusLine code > 299 ] ) ifTrue: [ 
		UIManager default 
			abort: aUrl asString, String cr, 'returns ', apiDef statusLine code asString, ' ',
			apiDef statusLine reason title: 'Unable to discover API'.
		^ nil ].
	
	apiDefObj := NeoJSONReader fromString: apiDef entity string.

	apiList := apiDefObj at: 'items' ifAbsent: [ Array new ].

	( apiList isKindOf: Array ) ifFalse: [ Array new ].
	apiNameList := OrderedCollection new.
	apiList do: [ :i || title ver pref |
		title := i at: 'title' ifAbsent: [ nil ].
		ver := i at: 'version' ifAbsent: [ nil ].
		pref := i at: 'preferred' ifAbsent: [ false ].
		title ifNotNil: [ | w |
			w := title.
			ver ifNotNil: [ w := w, ' (', ver, ')' ].
			pref ifTrue: [ w := w, '*' ].
			apiNameList add: w ] ].
   self sortAPILists