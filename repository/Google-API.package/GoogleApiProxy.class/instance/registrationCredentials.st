registration
registrationCredentials
	|  file cfgJson client_id client_secret redirect_url |

	" reads a json file with registration credentials. use Google api console to create one "

	file := self registrationCredentialsFile asFileReference.
	file exists ifFalse: [ self error: 'API registration credentials file (', file fullName, ') missing.' ].	
	
	cfgJson := NeoJSONReader fromString: file contents.
	client_secret := cfgJson at: 'client_secret' ifAbsent: [ '' ].
	redirect_url := cfgJson at: 'redirect_uris' ifAbsent: [ #() ].
	redirect_url := redirect_url at: 1 ifAbsent: [ '' ].
	
	^ ZnOAuth2ConsumerData 
			key: client_id
			secret: client_secret
			redirectUrl: redirect_url
