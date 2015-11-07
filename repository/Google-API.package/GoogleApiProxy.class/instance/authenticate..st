registration
authenticate: parameterDictionary
	| fn |

	fn := self authenticationCredentialsFile asFileReference.
	fn writeStreamDo: [ :stream | 
		stream nextPutAll: ( 
			NeoJSONWriter toString: parameterDictionary ) ].

	^ parameterDictionary
	