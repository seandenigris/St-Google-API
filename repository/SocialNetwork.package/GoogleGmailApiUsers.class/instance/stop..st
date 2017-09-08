generated
stop: userId 
	"
		Stop receiving push notifications for the given user mailbox.

		Parameters, * = required, optional parameters in optionsDict

		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #POST.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/stop' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.