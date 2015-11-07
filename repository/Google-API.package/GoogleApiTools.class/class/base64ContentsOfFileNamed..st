as yet unclassified
base64ContentsOfFileNamed: aString 
	| file base64Contents |
	
	file := FileStream readOnlyFileNamed: aString.
	base64Contents := ( Base64MimeConverter mimeEncode: file binary ) contents.
	file close.
	
	^ base64Contents