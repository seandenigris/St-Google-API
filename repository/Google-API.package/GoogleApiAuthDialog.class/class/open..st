as yet unclassified
open: anUrl
	Smalltalk garbageCollect.
	^ self new
		authUrl: anUrl;
		openAsMorph
