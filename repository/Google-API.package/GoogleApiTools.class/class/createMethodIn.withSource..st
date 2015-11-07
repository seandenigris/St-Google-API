as yet unclassified
createMethodIn: aClass withSource: source
	| selector |
	"| methodAndNode  method selector |"

	"methodAndNode := aClass 
							compile: source
							classified: nil
							notifying: nil
							trailer: aClass defaultMethodTrailer
							trailer: nil
							ifFail: [ ^nil ].
							
	selector := methodAndNode selector.
	method := methodAndNode method.
	
	aClass 
		addSelectorSilently: selector 
		withMethod: method.
	
	aClass 
		logMethodSource: source 
		forMethodWithNode: methodAndNode 
		inCategory: nil 
		withStamp: nil 
		notifying: nil."
	
	selector := aClass 
		compile: source
		classified: #generated
		withStamp: nil 
		notifying: nil
		logSource: true.
							
	^ selector

	
	" create instance variable "
	"varName := 'fld', ( fieldSymbol capitalized ).
	( entityClass instVarNames includes: varName ) ifFalse: [ 
		entityClass addInstVarNamed: varName ]."
	
	" create getter "
	"getterSelector := fieldSymbol.
	method := (entityClass compile: getterSelector, String cr,
								'^ ', varName
							classified: nil
							notifying: nil
							trailer: entityClass defaultMethodTrailer
							ifFail: [nil]) method.							
	entityClass addSelectorSilently: getterSelector withMethod: method."

	" create setter "
	"setterSelector := (fieldSymbol, ':') asSymbol.
	method := (entityClass compile: setterSelector, ' aValue', String cr,
								varName, ' := aValue'
							classified: nil
							notifying: nil
							trailer: entityClass defaultMethodTrailer
							ifFail: [nil]) method.	
	entityClass addSelectorSilently: setterSelector withMethod: method."

