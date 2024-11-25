accessing
url
	"Adapted from https://blog.mailchimp.com/how-to-pre-fill-items-on-your-mailchi		mp-hosted-form/"
	| result |
	result := 'http://facebook.us11.list-manage.com/subscribe' asUrl
			queryAt: 'u' put: self u;
			queryAt: 'id' put: self id;
			yourself.
	self email ifNotEmpty: [ :eml | result queryAt: 'MERGE0' put: eml ].
	self firstName ifNotEmpty: [ :fn | result queryAt: 'MERGE1' put: fn ].
	self lastName ifNotEmpty: [ :ln | result queryAt: 'MERGE2' put: ln ].
	^ result