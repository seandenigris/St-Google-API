accessing
id
	proxyId ifNil: [ proxyId := 'default' ].
	
	^ proxyId