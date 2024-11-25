sending
send: userId options: optionsDict
	"
		Sends the specified message to the recipients in the To, Cc, and Bcc headers.

		Parameters, * = required, optional parameters in optionsDict

		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #POST.
	values := self argumentsFor: thisContext.
	path := self rootPath, ( self 
		replacePlaceholdersIn: '/upload/gmail/v1/users/{userId}/messages/send' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.