as yet unclassified
createApi: apiDiscoveryObj inCategory: apiClassCategory
	| apiDefUrl apiDef apiDefObj apiName apiClassName apiAuth proxy url rootUrl des ver doc src |
	
	apiDefUrl := apiDiscoveryObj at: 'discoveryRestUrl' ifAbsent: [ 
		self error: 'discoveryRestUrl property missing' ].
	
	apiDef := ZnEasy get: apiDefUrl.
	( apiDef entity isKindOf: ZnStringEntity ) ifFalse: [
		self error: 'Invalid content received' ].
		
	apiDefObj := NeoJSONReader fromString: apiDef entity string.
	
"apiDefObj inspect."

	" check and extract api definition parameters "
	apiName := apiDefObj at: 'name' ifAbsent: [ self error: 'name property missing' ].
	url := apiDefObj at: 'baseUrl' ifAbsent: [ self error: 'baseUrl property missing' ].
	rootUrl := apiDefObj at: 'rootUrl' ifAbsent: [ self error: 'rootUrl property missing' ].
	des := apiDefObj at: 'description' ifAbsent: [ ].
	ver := apiDefObj at: 'version' ifAbsent: [ ].
	doc := apiDefObj at: 'documentationLink' ifAbsent: [ ].
	
	" create class comment "
	des ifNotNil: [ des := des, String cr, String cr ].
	des ifNil: [ des := '' ].
	des := des, 'Source: ', apiDefUrl, String cr.
	ver ifNotNil: [ des := des, 'Version: ', ver, String cr ].
	doc ifNotNil: [ des := des, 'Documentation: ', doc, String cr ].

	" create base class for this api "	
	apiClassName := 'Google', apiName capitalized, 'Api'.
	proxy := GoogleApiTools 
		createClassNamed: apiClassName 
		in: apiClassCategory
		subClassOf: GoogleApiProxy
		description: des.
		
	" root url method "
	src := 'rootPath', String cr, String tab, '^ ''', rootUrl, ''''.
	GoogleApiTools 
		createMethodIn: proxy 
		withSource: src.

	" base url method "
	src := 'basePath', String cr, String tab, '^ ''', url, ''''.
	GoogleApiTools 
		createMethodIn: proxy 
		withSource: src.

	" apiName method "
	src := 'apiName', String cr, String tab, '^ ''', apiName, ''''.
	GoogleApiTools 
		createMethodIn: proxy class
		withSource: src.

	" authentication scopes "
	src := 'scopes', String cr, 
		String tab, '^ OrderedCollection withAll: #(', String cr.
	apiAuth := apiDefObj at: 'auth' ifAbsent: [ {} ].
	apiAuth := apiAuth at: 'oauth2' ifAbsent: [ {} ].
	apiAuth := apiAuth at: 'scopes' ifAbsent: [ {} ].
	apiAuth keysDo: [ :k |
		src := src, String tab, String tab, '''', k asString, '''', String cr ].
	src := src, String tab, ')', String cr.
	GoogleApiTools 
		createMethodIn: proxy 
		withSource: src.	

	" create subclasses and methods for this api "
	GoogleApiCreator 
		createClassesFromResource: apiDefObj 
		underParentClass: proxy 
		withClassNamePrefix: apiClassName 
		inCategory: apiClassCategory 
		comment: ''.

