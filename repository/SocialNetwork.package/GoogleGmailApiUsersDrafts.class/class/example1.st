*SocialNetwork-examples
example1

	| userID api answer draftInfos draftMetaAnswer |
	userID := 'sean.p.denigris@gmail.com'.
	api := GoogleGmailApiUsersDrafts authenticated.
	answer := api list: userID.
	self assert: answer first isSuccess.
	draftInfos := answer second at: 'drafts'.
	draftMetaAnswer := api
		get: (draftInfos first at: 'id')
		userId: userID
		query: (Dictionary with: 'format' -> 'metadata')
		body: Dictionary new.
	self assert: draftMetaAnswer first isSuccess.
	((draftMetaAnswer second at: 'message') at: 'snippet')
		beginsWith: 'Thank you for your support! Sign up for important updates. '