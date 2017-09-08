as yet unclassified
removeDuplicateEmailAddressesFrom: aCollection

	| subscriberHash |
	subscriberHash := aCollection groupedBy: [ :e | e email ].
	^ subscriberHash values collect: [ :e | e first ]