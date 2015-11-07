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
	( txt size > 0) ifTrue: [ txt := txt, String cr, String cr ].
	
	( desc size > 0 ) ifTrue: [
		txt := txt, desc ].
	( txt size > 0) ifTrue: [ txt := txt, String cr, String cr ].
	
	txt := txt, 'Preferred: ', ( pref ifTrue: [ 'Yes' ] ifFalse: [ 'No' ] ).
	( txt size > 0) ifTrue: [ txt := txt, String cr, String cr ].
	
	(docLnk size > 0 ) ifTrue: [
		txt := txt, 'Link: ', docLnk ].
	
	
	^ txt
	