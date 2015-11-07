accesing
apiListIndex: index 
	apiListIndex := index.
	selectedApi := apiList
				at: index
				ifAbsent: [].
	self changed: #apiListIndex.
	self changed: #selectedApiDescription.