sorting
sortAPILists
	| namesSorted sortedList |
	namesSorted := APINameList sorted.
	sortedList := Array new: namesSorted size.
	namesSorted
		doWithIndex: [ :apiName :ind | sortedList at: ind put: (APIList at: (APINameList indexOf: apiName)) ].
	APINameList := namesSorted.
	APIList := sortedList