event handling
btnGenerateClick
	| apiDiscoverObj apiName category |
	category := ''.
	apiName := apiNameList at: apiListIndex ifAbsent: [ 'unknown' ].
	selectedCategory ifNotNil: [ category := selectedCategory asString ].
	category size < 1
		ifTrue: [ category := self
				textEntry: 'Enter a category for the new automatically generated classes.'
				title: 'Enter category'
				entryText: (self apiNameAsCategory: apiName).
			(category isNil or: [ category size < 1 ])
				ifTrue: [ self
						abort:
							'You must provide either an existing or a new category' , String cr
								, 'where the proxy classes should be generated'
						title: 'Unable to generate API'.
					^ nil ]
				ifFalse: [ SystemOrganizer default addCategory: category ] ].
	apiListIndex < 1
		ifTrue: [ self abort: 'You must select an API definition' title: 'Unable to generate API'.
			^ nil ].
	apiDiscoverObj := apiList
		at: apiListIndex
		ifAbsent: [ self abort: 'Internal error. Selected API not found.' title: 'Unable to generate API'.
			^ nil ].

	"apiDiscoverObj inspect."


	"apiName := apiDiscoverObj at: 'name' ifAbsent: [ 'unknown' ]."
	(self
		questionWithoutCancel:
			'Generate Google API (' , apiName , ')' , String cr , 'proxy classes in category ('
				, category , ') ?'
		title: 'Are you sure?')
		ifTrue: [ GoogleApiCreator createApi: apiDiscoverObj inCategory: category.
			(RPackageOrganizer default packageNamed: category) browse ]