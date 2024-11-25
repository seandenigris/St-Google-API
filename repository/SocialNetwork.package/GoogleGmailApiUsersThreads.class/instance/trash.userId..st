generated
trash: id userId: userId 
	"
		Moves the specified thread to the trash.

		Parameters, * = required, optional parameters in optionsDict

		id (String*): The ID of the thread to Trash.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #POST.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/threads/{id}/trash' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.