authentication
authenticationCredentialsFolder
	
		self flag: 'Maybe manually setting the file is enough?'.
		^ AuthenticationCredentialsFolder ifNil: [ FileSystem workingDirectory ]