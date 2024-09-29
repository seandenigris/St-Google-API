as yet unclassified
readApiDef: aUrl
	| apiDef apiDefObj |
	APINameList := OrderedCollection new.
	APIList := #().
	[ apiDef := ZnEasy get: aUrl.
	(apiDef entity isKindOf: ZnStringEntity)
		ifFalse: [ self error: 'Invalid content received' ] ]
		on: Error
		do: [ :ex | 
			| msg |
			msg := ex messageText = String empty
				ifTrue: [ ex asString ]
				ifFalse: [ ex messageText ].
			self abort: msg title: 'Unable to discover API'.
			^ nil ].
	(apiDef statusLine code < 200 or: [ apiDef statusLine code > 299 ])
		ifTrue: [ UIManager default
				abort:
					aUrl asString , String cr , 'returns ' , apiDef statusLine code asString , ' '
						, apiDef statusLine reason
				title: 'Unable to discover API'.
			^ nil ].
	apiDefObj := NeoJSONReader fromString: apiDef entity string.
	
	APIList := apiDefObj 
		at: 'items' 
		ifPresent: [ :dicts |
			dicts collect: [ :dict |
				GoogleApi fromDictionary: dict ] ]
		ifAbsent: [ Array new ].
	APIList sort: #title ascending.