generated
watch: userId 
	"
		Set up or update a push notification watch on the given user mailbox.

		Parameters, * = required, optional parameters in optionsDict

		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #POST.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/watch' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.