generated
get: id userId: userId messageId: messageId 
	"
		Gets the specified message attachment.

		Parameters, * = required, optional parameters in optionsDict

		id (String*): The ID of the attachment.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
		messageId (String*): The ID of the message containing the attachment.
	"

	| action path values |

	action := #GET.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: '{userId}/messages/{messageId}/attachments/{id}' with: values ).

	^ self makeRequestTo: path usingMethod: action with: nil.