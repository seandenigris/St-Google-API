accesing
selectedApiDescription
	| txt desc title ver pref docLnk |
	
	txt := ''.
	selectedApi ifNil: [ ^txt ].
	
	desc := selectedApi at: 'description' ifAbsent: [ '' ].
	docLnk := selectedApi at: 'documentationLink' ifAbsent: [ '' ].
	
	title := selectedApi at: 'title' ifAbsent: [].
	ver := selectedApi at: 'version' ifAbsent: [].
	pref := selectedApi at: 'preferred' ifAbsent: [ false ].
	title ifNotNil: [ | w |
		w := title.
		ver ifNotNil: [ w := w, ' (', ver, ')' ].
		pref ifTrue: [ w := w, '*' ].
		apiNameList add: w ].
	
	txt := title.
	txt isEmpty ifTrue: [ txt := txt, String cr, String cr ].
	
	desc isEmpty ifTrue: [
		txt := txt, desc ].
	txt isEmpty  ifTrue: [ txt := txt, String cr, String cr ].
	
	txt := txt, 'Preferred: ', ( pref ifTrue: [ 'Yes' ] ifFalse: [ 'No' ] ).
	txt isEmpty  ifTrue: [ txt := txt, String cr, String cr ].
	
	docLnk isEmpty  ifTrue: [
		txt := txt, 'Link: ', docLnk ].
	
	
	^ txt
	