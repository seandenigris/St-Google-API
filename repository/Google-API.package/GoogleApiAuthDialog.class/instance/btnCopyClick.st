accessing
btnCopyClick
	authUrl ifNotNil: [
		Clipboard default clipboardText: authUrl ].