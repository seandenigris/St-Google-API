generated
delete: id userId: userId 
	"
		Immediately and permanently deletes the specified label and removes it from any messages and threads that it is applied to.

		Parameters, * = required, optional parameters in optionsDict

		id (String*): The ID of the label to delete.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #DELETE.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/labels/{id}' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.