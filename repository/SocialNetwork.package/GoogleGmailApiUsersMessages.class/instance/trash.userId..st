generated
trash: id userId: userId 
	"
		Moves the specified message to the trash.

		Parameters, * = required, optional parameters in optionsDict

		id (String*): The ID of the message to Trash.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #POST.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/messages/{id}/trash' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.