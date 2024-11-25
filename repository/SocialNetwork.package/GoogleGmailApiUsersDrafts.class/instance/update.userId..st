generated
update: id userId: userId 
	"
		Replaces a draft's content.

		Parameters, * = required, optional parameters in optionsDict

		id (String*): The ID of the draft to update.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #PUT.
	values := self argumentsFor: thisContext.
	path := self rootPath, ( self 
		replacePlaceholdersIn: '/upload/gmail/v1/users/{userId}/drafts/{id}' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.