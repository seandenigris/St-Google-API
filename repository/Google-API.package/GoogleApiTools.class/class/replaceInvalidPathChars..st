as yet unclassified
replaceInvalidPathChars: aString
	| w |
	
	w := aString.
	w ifNotNil: [
		w := w copyWithRegex: '[:\\+\\*\\?\\''\\"\\.]' matchesReplacedWith: '_' ].
	
	^ w