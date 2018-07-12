event handling
apiNameAsCategory: aString
	^ String
		streamContents: [ :s | 
			| tokens |
			tokens := aString trimBoth substrings: #($  $( $) $*).
			tokens
				doWithIndex: [ :eachWord :ind | 
					eachWord size > 0
						ifTrue: [ s nextPutAll: eachWord capitalized.
							ind < tokens size
								ifTrue: [ s nextPut: $- ] ] ] ]