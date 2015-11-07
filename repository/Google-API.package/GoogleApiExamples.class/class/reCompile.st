as yet unclassified
reCompile

self class compile: (( self class methodDictionary at: #listGoogleDriveFiles ) ast source).
self class compile: (( self class methodDictionary at: #addTestFileToGoogleDrive ) ast source).