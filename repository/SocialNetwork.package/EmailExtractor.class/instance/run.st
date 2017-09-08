as yet unclassified
run

	| subscribers |
	subscribers := self parseData.
	^ self removeDuplicateEmailAddressesFrom: subscribers