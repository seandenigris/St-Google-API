as yet unclassified
newsletterUrl
	| form |
	form := MailChimpForm new
		u: 'ab40fa6dcb43014485155dc82';
		id: '7de9885081';
		yourself.
	self recipient fillMailChimpForm: form.
	^ form url