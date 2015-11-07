accesing
txtCategory: aStringOrText
	| index |
	
	selectedCategory := aStringOrText asString trimBoth.
	selectedCategory = String empty ifTrue: [ selectedCategory := nil ].
	
	index := self categoryNameList indexOf: selectedCategory ifAbsent: [ 0 ]. 	
	categoryListIndex := index.
	self changed: #categoryListIndex "]."
