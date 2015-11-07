user interface
openAsMorph 
	| m |
	window := (SystemWindow labelled: 'Google API''s')
				model: self.

	"self deferredMessageRecipient: WorldState."

	" Discover URL & button "		
	window
		addMorph: ( m := self uiDiscoverUrl )
		fullFrame: (LayoutFrame
			fractions: (0@0 corner: 1@0)
			offsets: (0@0 corner: 0@30)).
	m color: window color.
	
	
	
	
	" API List "
	window 
		addMorph: ( m := self uiApiList )
		fullFrame: (LayoutFrame 
			fractions: (0@0 corner: 0.5@0.45)
			offsets: (0@30 corner: 0@0)).
	m color: window color.

	" API Description "
	window 
		addMorph: ( m := self uiApiDescription )
		fullFrame: (LayoutFrame 
			fractions: (0.5@0 corner: 1@0.45)
			offsets: (0@30 corner: 0@0)).	
	m color: window color.

	" Categoriy List "		
	window 
		addMorph: ( m := self uiCategoryList )
		fullFrame: (LayoutFrame 
			fractions: (0.0@0.45 corner: 0.5@1)
			offsets: (0@30 corner: 0@30 negated)).	
	m color: window color.
	
	" Action Panel "
	window 
		addMorph: ( m := self uiActionPanel )
		fullFrame: (LayoutFrame 
			fractions: (0.5@0.45 corner: 1@1)
			offsets: (0@30 corner: 0@30 negated)).	
	m color: window color.

	window setUpdatablePanesFrom: #(#processNameList #stackNameList ).
	(window setLabel: 'Google API''s') openInWorld.

	^ window
	