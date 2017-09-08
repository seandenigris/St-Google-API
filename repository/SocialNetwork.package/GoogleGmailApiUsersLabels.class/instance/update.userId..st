generated
update: id userId: userId 
	"
		Updates the specified label.

		Parameters, * = required, optional parameters in optionsDict

		id (String*): The ID of the label to update.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #PUT.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/labels/{id}' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.