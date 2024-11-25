as yet unclassified
fillMailChimpForm: form
	form email: self email.
	self firstName ifNotEmpty: [ :fn | form firstName: fn ].
	self lastName ifNotEmpty: [ :ln | form lastName: ln ].