event handling
btnGenerateClick
	| apiDiscoverObj apiName category |

	category := ''.
	selectedCategory ifNotNil: [
		category := selectedCategory asString ].
	( category size < 1 ) ifTrue: [ 
		self abort: 'You must provide either an existing or a new category', String cr,
		'where the proxy classes should be generated' title: 'Unable to generate API'.
		^ nil ].
	
	( apiListIndex < 1) ifTrue: [ 
		self abort: 'You must select an API definition' title: 'Unable to generate API'.
		^ nil ].

	apiDiscoverObj := apiList at: apiListIndex ifAbsent: [ 
		self abort: 'Internal error. Selected API not found.' title: 'Unable to generate API'.
		^ nil ].

"apiDiscoverObj inspect."


	"apiName := apiDiscoverObj at: 'name' ifAbsent: [ 'unknown' ]."
	apiName := apiNameList at: apiListIndex ifAbsent: [ 'unknown' ].
	
	( self questionWithoutCancel: 
			'Generate Google API (', apiName, ')', String cr,
			'proxy classes in category (', category, ')' 
		title: 'Are you sure' ) ifTrue: [ 
			GoogleApiCreator createApi: apiDiscoverObj inCategory: category ].
	