as yet unclassified
listGoogleDriveFiles
	| files fileApi result items | 
	
	" list files in Google Drive in the Transcript see "
	" https://developers.google.com/drive/v2/reference/files/list "
	
	fileApi := GoogleDriveApiFiles new.
	fileApi authenticate. 
	
	" send request "
	[ result := fileApi list ] on: Error do: [ :ex |
		ex inspect.
		self halt ]. 
	
	" display listing in transcript window "
	files := result at: 2.	
	items := files at: 'items' ifAbsent: [ Array new ].
	items do: [ :item || fileName labels isDeleted |
		fileName := item at: 'title' ifAbsent: [ 'unknown' ].
		labels := item at: 'labels' ifAbsent: [ Dictionary new ].
		isDeleted := labels at: 'trashed' ifAbsent: [ false ].
		
		Transcript show: fileName, '  ', 
			[ isDeleted 
				ifTrue: [ '(deleted)' ] 
				ifFalse: [ '' ] ] value; cr ].
	
	^ result
	