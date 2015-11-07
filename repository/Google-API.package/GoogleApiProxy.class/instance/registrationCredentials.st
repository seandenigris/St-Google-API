registration
registrationCredentials
	|  fn cfgJson client_id client_secret redirect_url |

	" reads a json file with registration credentials. use Google api console to create one "

	fn := self registrationCredentialsFile asFileReference.
	fn exists ifFalse: [ self error: 'API registration credentials file (', fn fullName, ') missing.' ].	
	
	cfgJson := ( fn readStream ) contents.	
	cfgJson := NeoJSONReader fromString: cfgJson.
	cfgJson := cfgJson at: 'installed' ifAbsent: [ {} ].
	
	client_id := cfgJson at: 'client_id' ifAbsent: [ '' ].
	client_secret := cfgJson at: 'client_secret' ifAbsent: [ '' ].
	redirect_url := cfgJson at: 'redirect_uris' ifAbsent: [ #() ].
	redirect_url := redirect_url at: 1 ifAbsent: [ '' ].
	
	^ ZnOAuth2ConsumerData 
			key: client_id
			secret: client_secret
			redirectUrl: redirect_url
