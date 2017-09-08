as yet unclassified
makeRequestTo: url usingMethod: method with: dictionary
	^ super makeRequestTo: url ? ('v' -> '3.0') usingMethod: method with: dictionary