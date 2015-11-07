accessing
infoText
	^ (
			( Text withAll: 'Use your browser to go to this URL:', String cr, String cr ) , 
			( Text string: 'http://www.google.at' 
				attribute: ( TextURL new url: 'http://philippeback.eu' ) ),
			( Text withAll: String cr, String cr, 'and enter the code here:' )
		).