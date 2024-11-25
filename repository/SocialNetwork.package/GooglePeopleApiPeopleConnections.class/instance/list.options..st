generated
list: resourceName options: optionsDict
	"
		Provides a list of the authenticated user's contacts merged with any linked profiles.

		Parameters, * = required, optional parameters in optionsDict

		pageToken (String): The token of the page to be returned.
		resourceName (String*): The resource name to return connections for. Only `people/me` is valid.
		syncToken (String): A sync token, returned by a previous call to `people.connections.list`. Only resources changed since the sync token was created are returned.
		pageSize (Integer): The number of connections to include in the response. Valid values are between 1 and 500, inclusive. Defaults to 100.
		sortOrder (String): The order in which the connections should be sorted. Defaults to `LAST_MODIFIED_ASCENDING`.
		requestMask.includeField (String): Comma-separated list of fields to be included in the response. Omitting this field will include all fields. Each path should start with `person.`: for example, `person.names` or `person.photos`.
	"

	| action path values |

	action := #GET.
	values := self argumentsFor: thisContext.
	path := self basePath, ( self 
		replacePlaceholdersIn: 'v1/{resourceName}/connections' with: values ).

	^ self makeRequestTo: path usingMethod: action with: optionsDict.