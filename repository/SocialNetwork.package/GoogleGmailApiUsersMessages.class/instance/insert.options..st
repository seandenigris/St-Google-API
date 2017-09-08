generated
insert: userId options: optionsDict
	"
		Directly inserts a message into only this user's mailbox similar to IMAP APPEND, bypassing most scanning and classification. Does not send a message.

		Parameters, * = required, optional parameters in optionsDict

		deleted (Boolean): Mark the email as permanently deleted (not TRASH) and only visible in Google Apps Vault to a Vault administrator. Only used for Google Apps for Work accounts.
		internalDateSource (String): Source for Gmail's internal date of the message.
		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
	"

	| action path values |

	action := #POST.
	values := self argumentsFor: thisContext.
	path := self rootPath, ( self 
		replacePlaceholdersIn: '/upload/gmail/v1/users/{userId}/messages' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.