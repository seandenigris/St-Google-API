convenience
contacts
	^ self makeRequestTo: 'https://www.google.com/m8/feeds/contacts' asUrl / self user / 'full' usingMethod: #GET with: Dictionary new