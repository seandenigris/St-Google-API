creating
create: userId options: optionsDict
	"
		Creates a new draft with the DRAFT label.

		Parameters, * = required, optional parameters in optionsDict

		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #POST.
	values := self argumentsFor: thisContext.
	path := self rootPath, ( self 
		replacePlaceholdersIn: '/upload/gmail/v1/users/{userId}/drafts' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.