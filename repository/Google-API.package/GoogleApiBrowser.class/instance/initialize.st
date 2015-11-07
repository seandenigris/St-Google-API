as yet unclassified
initialize
	super initialize.
	
	apiListIndex := 0.
	categoryListIndex := 0.
	discoverUrl := 'https://www.googleapis.com/discovery/v1/apis'.
	
	self updateApiList; 
		apiListIndex: 1
		
