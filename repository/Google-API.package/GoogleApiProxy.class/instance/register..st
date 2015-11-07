registration
register: aRegistrationCode
	|  parameterDictionary |
	
	" Accepts the code from registration url request "

	session ifNil: [ 
		self error: 'Start registration with #register' ].
	
	( parameterDictionary := Dictionary new ) 
		add: 'code' -> aRegistrationCode.
	
	session handleAuthenticationCallback: parameterDictionary.
	
	"
		If we come here without errors registration was OK
		save session accessToken & session refreshToken & session tokenType 
		in authenticationCredentials json file
	"
	
	parameterDictionary := Dictionary new.
	parameterDictionary at: 'access_token' put: session accessToken.
	parameterDictionary at: 'refresh_token' put: session refreshToken.
	parameterDictionary at: 'token_type' put: session tokenType.

	self authenticate: parameterDictionary.
	
	^ parameterDictionary
	