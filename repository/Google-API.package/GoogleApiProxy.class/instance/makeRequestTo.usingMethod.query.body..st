api
makeRequestTo: aUrl usingMethod: httpMethod query: queryDictionary body: bodyDictionary
	| a  req res client returnCode auth content  |
	
	session ifNil: [
		self error: 'Authenticate API first with #authenticate' ].

	a := methodAction at: httpMethod ifAbsent: [
		self error: 'Unsupported http method (', httpMethod, ')' ].

	client := ZnClient new.
	
	" create request "
	req := a value: aUrl value: ( session accessToken ).
	
	client
		request: req;
		method: ( req method ).
		
	queryDictionary keysAndValuesDo: [ :k :v | client request url queryAt: k put: v ].
		
	( bodyDictionary isNotNil and: [ bodyDictionary size > 0 ] ) ifTrue: [ | json part contentMime |
		req entity: ZnMultiPartMixedEntity new.
		client request url queryAt: 'uploadType' add: 'multipart'.
		
		bodyDictionary at: 'CONTENT' ifPresent: [ :cont |
		bodyDictionary removeKey: 'CONTENT'.
		content := (Base64MimeConverter mimeEncode: cont readStream ) contents.		
		contentMime := bodyDictionary at: 'mimeType' ifAbsent: [ 'application/octet-stream' ] ].		
		json := NeoJSONWriter toString: bodyDictionary.
		
		json ifNotNil: [
			part := ZnMimePart new.
			part entity: ( ( ZnStringEntity 
				type: ( ZnMimeType main: 'application' sub: 'json' ) )
				string: json;
				yourself ).
			req entity addPart: ( part ).
			].
		
		content ifNotNil: [
			part := ZnMimePart new.
			part entity: ( ( ZnStringEntity 
				type: ( ZnMimeType fromString: contentMime ) )
				string: content;
				yourself ).
			part headers at: 'Content-Transfer-Encoding' put: 'base64'.
			req entity addPart: ( part ) ].
		
		"aParamDictionary keysAndValuesDo: [ :key :val |
			z addPart: (ZnMimePart fieldName: key value: val).
			]."
		].


"st := WriteStream on: ( String new ).
client request writeOn: st.
st inspect."

	Halt once.
	res := client
		execute.
	returnCode := client response statusLine code.

	" if we get a 401 return and have a refresh token try a refreshAuthenticate and repeat request "
	( returnCode = 401 ) ifTrue: [
			session refreshToken ifNotNil: [
				auth := self authenticateRefresh.

				" recreate url with frefreshed tokens and repeat request "
				req := a value: aUrl value: ( session accessToken ).
				res := client
					request: req;
					execute.
				returnCode := client response statusLine code ] ].
	
	" if request was not successfull throw erro with result in tag "
	( returnCode < 200 or: [ returnCode > 299 ] ) ifTrue: [
		Error new
			tag: res;
			signal: 'Request returns non OK status code (', returnCode asString, ')' ].

	content := res.
	( client response entity contentType matches: ZnMimeType applicationJson ) ifTrue: [
		content := NeoJSONReader fromString: res ].
		
	^ { client response. content. }
	

