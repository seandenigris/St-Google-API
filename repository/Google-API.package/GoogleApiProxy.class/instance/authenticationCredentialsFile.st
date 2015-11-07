authentication
authenticationCredentialsFile
	authenticationCredentialsFile ifNil: [ | dir fn |
		dir := FileSystem workingDirectory.
		fn := ( GoogleApiTools replaceInvalidPathChars: self apiName ), '.', self id, '.auth.json'.
		fn := dir / 'google_api_data' / fn.
		authenticationCredentialsFile := fn fullName ].
	
	^ authenticationCredentialsFile
