authentication
authenticationCredentials
	| fn authJson |
	
	fn := self authenticationCredentialsFile asFileReference.
	fn exists ifFalse: [ 
		self error: 'API not registered. Authentication file (', fn fullName, ') missing' ].	
	
	authJson := ( fn readStream ) contents.	
	authJson := NeoJSONReader fromString: authJson.	
		
	^ authJson