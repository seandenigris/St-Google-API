authentication
authenticate
	| authJson regUrl |
	
	regUrl := self register.
			
	" try to read authentication json file, if missing start authentication process "
	[ authJson := self authenticationCredentials ] 
		on: Error do: [ | code |			
			"
				display dialog asking the user to browse to auth url for requesting an authentication code.
				requests auth code from user. 
				If no code was entered or dialog canceld do nothing
				if code was entered create tokens and save in authentication json file for
				later use
			"
			code := GoogleApiAuthDialog open: regUrl asString.
			code ifNil: [ ^false ].	
			authJson := self register: code ].

	session accessToken: ( authJson at: 'access_token' ifAbsent: [ nil ] ).
	session refreshToken: ( authJson at: 'refresh_token' ifAbsent: [ nil ] ).
	"session tokenType: ( authJson at: 'token_type' ifAbsent: [ nil ] )."

	^ true
	