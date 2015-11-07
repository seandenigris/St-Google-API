as yet unclassified
updateApiList
	| oldSelectedApi newIndex |

	oldSelectedApi := selectedApi.
	apiList := selectedApi := nil.

	self readApiDef: discoverUrl.
		
	newIndex := apiList
				indexOf: oldSelectedApi
				ifAbsent: [ ( apiList size > 0 )
					ifTrue: [ 1 ]
					ifFalse: [ 0 ] ].
				
	self changed: #apiNameList.
	self apiListIndex: newIndex
