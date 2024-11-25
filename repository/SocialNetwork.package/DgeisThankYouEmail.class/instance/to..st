as yet unclassified
to: commenter
	super to: commenter.
	self recipient: commenter.
	self
		addAlternativePart: self plainTextPart contentType: 'text/plain';
		addAlternativePart: self htmlPart contentType: 'text/html'