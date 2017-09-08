| button |
button := HtmlButton new
	color: (Color fromHexString: '505050');
	target: 'http://google.com' asUrl;
	label: 'Google It';
	yourself.
button sourceString