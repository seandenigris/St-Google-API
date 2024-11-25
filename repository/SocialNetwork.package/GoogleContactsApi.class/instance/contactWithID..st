convenience
contactWithID: aString
	^ self makeRequestTo: 'https://www.google.com/m8/feeds/contacts' asUrl / self user / 'full' / aString usingMethod: #GET with: Dictionary new