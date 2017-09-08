generated
get: id userId: userId options: optionsDict
	"
		Gets the specified draft.

		Parameters, * = required, optional parameters in optionsDict

		format (String): The format to return the draft in.
		id (String*): The ID of the draft to retrieve.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #GET.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/drafts/{id}' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.