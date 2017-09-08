as yet unclassified
parseData

	| senderLines email word lastName firstName fullName reversedName name emailOnly nameAndEmail parser senders |
	senderLines := $~ split: self data.
	senders := senderLines
		collect:
			[ :e | 
			email := ($> asParser | #space asParser) negate plus flatten.
			"	name := $< asParser negate plus flatten."
			word := ($, asParser | $\ asParser | $< asParser | #space asParser) negate plus flatten.
			firstName := lastName := word.
			fullName := (firstName separatedBy: #space asParser) flatten.
			reversedName := ('\"' asParser , lastName , ', ' asParser , firstName , '\"' asParser)
				==> [ :nodes | nodes fourth , ' ' , nodes second ].
			name := fullName | reversedName.	"| firstName"
			emailOnly := email end
				==> [ :eml | 
					Subscriber new
						email: eml;
						yourself ].
			nameAndEmail := (name , #space asParser , $< asParser , email , $> asParser)
				==>
					[ :nodes | 
					Subscriber new
						name: nodes first;
						email: nodes fourth;
						yourself ].
			parser := emailOnly | nameAndEmail.
			parser parse: e ].
	^ senders