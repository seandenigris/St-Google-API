authentication
authenticateRefresh
	| isAuthOK parameterDictionary |

	isAuthOK := self authenticate.
	isAuthOK ifFalse: [ ^false ].
	
	session handleTokenRefresh.
	
	parameterDictionary := Dictionary new.
	parameterDictionary at: 'access_token' put: session accessToken.
	parameterDictionary at: 'refresh_token' put: session refreshToken.
	parameterDictionary at: 'token_type' put: session tokenType.
	
	self authenticate: parameterDictionary.
	
	^ true
	