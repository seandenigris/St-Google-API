accesing
categoryListIndex: index 
	categoryListIndex := index.
	selectedCategory := self categoryNameList
				at: index
				ifAbsent: [ nil ].
	self changed: #categoryListIndex.
	self changed: #txtCategory.