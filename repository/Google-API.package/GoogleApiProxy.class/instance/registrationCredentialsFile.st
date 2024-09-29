registration
registrationCredentialsFile
	registrationCredentialsFile ifNil: [ | dir fn |
		dir := FileSystem workingDirectory.
		fn := ( GoogleApiTools replaceInvalidPathChars: self apiName ), '.', self id, '.config.json'.
		fn := dir / 'google_api_data' / fn.
		registrationCredentialsFile := fn fullName ].
	
	^ registrationCredentialsFile