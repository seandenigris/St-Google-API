generated
delete: id userId: userId 
	"
		Immediately and permanently deletes the specified thread. This operation cannot be undone. Prefer threads.trash instead.

		Parameters, * = required, optional parameters in optionsDict

		id (String*): ID of the Thread to delete.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #DELETE.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/threads/{id}' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.