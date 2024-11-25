generated
get: id userId: userId options: optionsDict
	"
		Gets the specified thread.

		Parameters, * = required, optional parameters in optionsDict

		metadataHeaders (String): When given and format is METADATA, only include headers specified.
		format (String): The format to return the messages in.
		id (String*): The ID of the thread to retrieve.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #GET.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/threads/{id}' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.