initialization
initialize
	super initialize.
	
	methodAction := Dictionary new.
	
	methodAction at: #GET put: [ :apiUrl :token || url req |
		url := apiUrl asUrl
			queryAt: 'access_token' put: token;
			yourself.		
		req := ZnRequest get: url.
		req ].
	
	methodAction at: #PUT put: [ :apiUrl :token || url req |
		url := apiUrl asUrl
			queryAt: 'access_token' put: token;
			yourself.		
		req := ZnRequest put: url.
		req ].
	
	methodAction at: #POST put: [ :apiUrl :token || url req |
		url := apiUrl asUrl
			queryAt: 'access_token' put: token;
			yourself.		
		req := ZnRequest post: url.
		req ].

