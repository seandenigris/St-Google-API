*SocialNetwork
authenticatedFor: account
	| credentialsFolder |
	credentialsFolder := FileLocator home / 'Dynabook' / 'User Data' / 'Social Network'.
	^ self new
			authenticationCredentialsFile: credentialsFolder / (self apiName, '.', account nickname asLowercase, '.auth.json');
			registrationCredentialsFile: credentialsFolder / (self apiName, '.config.json');
			authenticate;
			yourself