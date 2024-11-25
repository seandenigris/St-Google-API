as yet unclassified
saveDgeisDrafts

	| reader commenters |
	reader := NeoCSVReader on: (FileLocator home / 'Downloads' / 'Commenters - Sheet1.csv') readStream.
	commenters := reader
		skipHeader;
		addField;
		addField;
		addField;
		upToEnd.
	commenters := commenters
		collect: [ :e | 
			Subscriber new
				firstName: e first;
				lastName: e second;
				email: e third;
				yourself ].
	(commenters "copyFrom: 15 to: 19") do: [ :e | (DgeisThankYouEmail to: commenters e) saveAsDraft ]