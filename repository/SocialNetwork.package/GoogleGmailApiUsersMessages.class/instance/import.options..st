generated
import: userId options: optionsDict
	"
		Imports a message into only this user's mailbox, with standard email delivery scanning and classification similar to receiving via SMTP. Does not send a message.

		Parameters, * = required, optional parameters in optionsDict

		userId (String*): The user's email address. The special value me can be used to indicate the authenticated user.
		internalDateSource (String): Source for Gmail's internal date of the message.
		deleted (Boolean): Mark the email as permanently deleted (not TRASH) and only visible in Google Apps Vault to a Vault administrator. Only used for Google Apps for Work accounts.
		neverMarkSpam (Boolean): Ignore the Gmail spam classifier decision and never mark this email as SPAM in the mailbox.
		processForCalendar (Boolean): Process calendar invites in the email and add any extracted meetings to the Google Calendar for this user.
	"

	| action path values |

	action := #POST.
	values := self argumentsFor: thisContext.
	path := self rootPath, ( self 
		replacePlaceholdersIn: '/upload/gmail/v1/users/{userId}/messages/import' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.