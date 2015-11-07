utilities
replacePlaceholdersIn: aTemplateString with: aDictionary 
	| template params w reg |
	
	" 
	GoogleApiTools replacePlaceholders: 'I am a {param}' 
		with: { 'param' -> 'test' } asDictionary 
	"
	
	template := aTemplateString.
	template ifNil: [ template := '' ]
			ifNotNil: [ template := template asString ].
	
	params := aDictionary.
	params ifNil: [ params := Dictionary new ].
	
	reg := '({([a-zA-Z0-9_]+)})' asRegex.
	w := aTemplateString 
			copyWithRegex: '{[a-zA-Z0-9_]+}' 
			matchesTranslatedUsing: [ :placeholder || key value |
				reg matchesPrefix: placeholder.
				key := reg subexpression: 3.
				value := aDictionary at: key ifAbsent: [ reg subexpression: 2 ].
				value asString
			].
	^ w