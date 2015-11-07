as yet unclassified
replacePlaceholders: aTemplate with: aDictionary 
	| template params w reg |
	
	" 
	GoogleApiTools replacePlaceholders: 'I am a {param}' 
		with: { 'param' -> 'test' } asDictionary 
	"
	
	template := aTemplate.
	template ifNil: [ template := '' ]
			ifNotNil: [ template := template asString ].
	
	params := aDictionary.
	params ifNil: [ params := Dictionary new ].
	
	reg := '({([a-zA-Z0-9]+)})' asRegex.
	
	w := aTemplate 
			copyWithRegex: '{[a-zA-Z0-9]+}' 
			matchesTranslatedUsing: [ :placeholder || key value |
				reg matchesPrefix: placeholder.
				key := reg subexpression: 3.
				value := aDictionary at: key ifAbsent: [ reg subexpression: 2 ].
				value asString
			].
	^ w