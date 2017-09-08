as yet unclassified
saveAsDraft
	| raw api |
	api := GoogleGmailApiUsersDrafts authenticatedFor: self class senderAccount.
	raw := self asSendableText base64Encoded.
	"Web-safe base64 from https://stackoverflow.com/questions/26663529/invalid-value-for-bytestring-error-when-calling-gmail-send-api-with-base64-encod"
	raw := raw copyReplaceAll: '+' with: '-'.
	raw := raw copyReplaceAll: '/' with: '_'.
	api create: self class senderAccount email options: (Dictionary with: 'message' -> (Dictionary with: 'raw' -> raw))