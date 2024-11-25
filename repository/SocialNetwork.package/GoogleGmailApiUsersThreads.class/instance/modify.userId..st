generated
modify: id userId: userId 
	"
		Modifies the labels applied to the thread. This applies to all messages in the thread.

		Parameters, * = required, optional parameters in optionsDict

		id (String*): The ID of the thread to modify.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #POST.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/threads/{id}/modify' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.