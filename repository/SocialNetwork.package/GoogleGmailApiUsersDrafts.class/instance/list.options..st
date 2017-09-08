generated
list: userId options: optionsDict
	"
		Lists the drafts in the user's mailbox.

		Parameters, * = required, optional parameters in optionsDict

		pageToken (String): Page token to retrieve a specific page of results in the list.
		maxResults (Integer): Maximum number of drafts to return.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #GET.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/drafts' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.