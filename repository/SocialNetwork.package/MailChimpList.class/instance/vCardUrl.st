as yet unclassified
vCardUrl
	| result |
	result := 'http://facebook.us11.list-manage.com/vcard' asUrl.
	^ result
			queryAt: 'u' put: self u;
			queryAt: 'id' put: self id;
			yourself