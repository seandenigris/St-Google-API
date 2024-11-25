generated
list: userId options: optionsDict
	"
		Lists the history of all changes to the given mailbox. History results are returned in chronological order (increasing historyId).

		Parameters, * = required, optional parameters in optionsDict

		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
		pageToken (String): Page token to retrieve a specific page of results in the list.
		startHistoryId (String): Required. Returns history records after the specified startHistoryId. The supplied startHistoryId should be obtained from the historyId of a message, thread, or previous list response. History IDs increase chronologically but are not contiguous with random gaps in between valid IDs. Supplying an invalid or out of date startHistoryId typically returns an HTTP 404 error code. A historyId is typically valid for at least a week, but in some rare circumstances may be valid for only a few hours. If you receive an HTTP 404 error response, your application should perform a full sync. If you receive no nextPageToken in the response, there are no updates to retrieve and you can store the returned historyId for a future request.
		maxResults (Integer): The maximum number of history records to return.
		labelId (String): Only return messages with a label matching the ID.
	"

	| action path values |

	action := #GET.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/history' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.