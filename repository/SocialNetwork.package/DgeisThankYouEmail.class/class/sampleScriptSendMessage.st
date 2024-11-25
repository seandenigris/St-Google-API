as yet unclassified
sampleScriptSendMessage
	<script>
	| api message raw |
	api := GoogleGmailApiUsersMessages authenticated.
	message := MailMessage
		from: '"New Rochelle Firefighters" <sean.p.denigris@gmail.com>'
		to: { '"Brother Sean" <sean@clipperadams.com>'. }
		about: 'Thank you for your support!'
		asFollows: ''.
	message
		addAlternativePart: self plainTextPart contentType: 'text/plain';
		addAlternativePart: self htmlPart
			contentType: 'text/html'.
	raw := message asSendableText base64Encoded.
	"Web-safe base64 from https://stackoverflow.com/questions/26663529/invalid-value-for-bytestring-error-when-calling-gmail-send-api-with-base64-encod"
	raw := raw copyReplaceAll: '+' with: '-'.
	raw := raw copyReplaceAll: '/' with: '_'.
	api send: 'sean.p.denigris@gmail.com' options: (Dictionary with: 'raw' -> raw)