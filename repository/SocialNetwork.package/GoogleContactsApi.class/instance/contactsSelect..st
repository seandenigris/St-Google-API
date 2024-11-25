convenience
contactsSelect: aBlock
	| url |
	url := 'https://www.google.com/m8/feeds/contacts' asUrl / self user / 'full'.
	aBlock value: url.
	^ self makeRequestTo: url usingMethod: #GET with: Dictionary new