user interface
openAsMorph 
	| m fractions offsets lf lo df do af ao cf co |
	window := (SystemWindow labelled: 'Google API''s')
				model: self.

	"self deferredMessageRecipient: WorldState."
	fractions := (0@0 extent: 1@0).
	offsets := (0@0 extent: 0@30).	
	" Discover URL & button "		
	window
		addMorph: ( m := self uiDiscoverUrl )
		fullFrame: (LayoutFrame  identity
				topFraction: fractions top offset: offsets top;
				leftFraction: fractions left offset: offsets left;
				bottomFraction: fractions bottom offset: offsets bottom;
				rightFraction: fractions right offset: offsets right).
	m color: window color.
		
	" API List "
	lf := (0@0 extent: 0.5@0.45).
	lo := (0@30 extent: 0@0).	
	window 
		addMorph: ( m := self uiApiList )
		fullFrame: (LayoutFrame  identity
				topFraction: lf top offset: lo top;
				leftFraction: lf left offset: lo left;
				bottomFraction: lf bottom offset: lo bottom;
				rightFraction: lf right offset: lo right).
	m color: window color.

	" API Description "
	df := (0.5@0 extent: 1@0.45).
	do := (0@30 extent: 0@0).	
	window 
		addMorph: ( m := self uiApiDescription )
		fullFrame: (LayoutFrame  identity
				topFraction: df top offset: do top;
				leftFraction: df left offset: do left;
				bottomFraction: df bottom offset: do bottom;
				rightFraction: df right offset: do right).
	m color: window color.

	" Categoriy List "		
	af := (0.0@0.45 extent: 0.5@1).
	ao := (0@30 extent: 0@30).			
	window 
		addMorph: ( m := self uiCategoryList )
		fullFrame: (LayoutFrame  identity
				topFraction: af top offset: ao top;
				leftFraction: af left offset: ao left;
				bottomFraction: af bottom offset: ao bottom;
				rightFraction: af right offset: ao right).
	m color: window color.
	
	" Action Panel "
	cf := (0.5@0.45 extent: 1@1).
	co := (0@30 extent: 0@30 negated).		
	window 
		addMorph: ( m := self uiActionPanel )
		fullFrame: (LayoutFrame  identity
				topFraction: cf top offset: co top;
				leftFraction: cf left offset: co left;
				bottomFraction: cf bottom offset: co bottom;
				rightFraction: cf right offset: co right).
	m color: window color.

	window setUpdatablePanesFrom: #(#processNameList #stackNameList ).
	(window setLabel: 'Google API''s') openInWorld.

	^ window
	