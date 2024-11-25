generated
get: resourceName options: optionsDict
	"
		Provides information about a person resource for a resource name. Use `people/me` to indicate the authenticated user.

		Parameters, * = required, optional parameters in optionsDict

		resourceName (String*): The resource name of the person to provide information about. - To get information about the authenticated user, specify `people/me`. - To get information about any user, specify the resource name that identifies the user, such as the resource names returned by [`people.connections.list`](/people/api/rest/v1/people.connections/list).
		requestMask.includeField (String): Comma-separated list of fields to be included in the response. Omitting this field will include all fields. Each path should start with `person.`: for example, `person.names` or `person.photos`.
	"

	| action path values |

	action := #GET.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: 'v1/{resourceName}' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.