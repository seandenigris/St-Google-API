registration
register
	| url |
	
	" try to read configuration json file to construct authentication url "
	
	session := ZnGoogleOAuth2Session google: self registrationCredentials.
	session beOfflineAccessType;
		"forceApprovalPrompt;"
		scopes: ( self scopes ).

	url := session authenticationUrl.
	
	^ url
	