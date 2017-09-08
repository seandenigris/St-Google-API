generated
getBatchGet: optionsDict
	"
		Provides information about a list of specific people by specifying a list of requested resource names. Use `people/me` to indicate the authenticated user.

		Parameters, * = required, optional parameters in optionsDict

		requestMask.includeField (String): Comma-separated list of fields to be included in the response. Omitting this field will include all fields. Each path should start with `person.`: for example, `person.names` or `person.photos`.
		resourceNames (String): The resource name, such as one returned by [`people.connections.list`](/people/api/rest/v1/people.connections/list), of one of the people to provide information about. You can include this parameter up to 50 times in one request.
	"

	| action path values |

	action := #GET.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: 'v1/people:batchGet' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.