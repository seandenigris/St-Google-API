generated
delete: id userId: userId 
	"
		Immediately and permanently deletes the specified draft. Does not simply trash it.

		Parameters, * = required, optional parameters in optionsDict

		id (String*): The ID of the draft to delete.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #DELETE.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/drafts/{id}' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.