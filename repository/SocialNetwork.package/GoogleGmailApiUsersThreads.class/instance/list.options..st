generated
list: userId options: optionsDict
	"
		Lists the threads in the user's mailbox.

		Parameters, * = required, optional parameters in optionsDict

		includeSpamTrash (Boolean): Include threads from SPAM and TRASH in the results.
		pageToken (String): Page token to retrieve a specific page of results in the list.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
		labelIds (String): Only return threads with labels that match all of the specified label IDs.
		maxResults (Integer): Maximum number of threads to return.
		q (String): Only return threads matching the specified query. Supports the same query format as the Gmail search box. For example, ""from:someuser@example.com rfc822msgid: is:unread"".
	"

	| action path values |

	action := #GET.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/threads' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.