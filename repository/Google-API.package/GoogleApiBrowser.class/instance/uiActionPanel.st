user interface
uiActionPanel
	| m fractions offsets mfractions moffsets 
	pfractions poffsets bfractions boffsets |
	
	m := Morph new layoutPolicy: ProportionalLayout new.

	" Category label and txtbox "	
	fractions := (0@0 extent: 1@0).
	offsets := (0@7 extent: 100@30).		
	m addMorph: (TextMorph new 
			contents: ' Actions')
		fullFrame: (LayoutFrame  identity
				topFraction: fractions top offset: offsets top;
				leftFraction: fractions left offset: offsets left;
				bottomFraction: fractions bottom offset: offsets bottom;
				rightFraction: fractions right offset: offsets right).
	
	mfractions := (0@0 corner: 1@0).
	moffsets := (0@30 corner: 0@60).			
	m addMorph: (self uiCategoryInput)
		fullFrame: (LayoutFrame  identity
				topFraction: mfractions top offset: moffsets top;
				leftFraction: mfractions left offset: moffsets left;
				bottomFraction: mfractions bottom offset: moffsets bottom;
				rightFraction: mfractions right offset: moffsets right).
	
	" Generate and Cancel buttons "
	pfractions := (0@0 corner: 0.5@0).
	poffsets := (0@80 corner: 0@1100).	
	m addMorph: (PluggableButtonMorph
				on: self 
				getState: nil
				action: #btnGenerateClick
				label: #btnGenerateLabel)
			fullFrame: (LayoutFrame  identity
				topFraction: pfractions top offset: poffsets top;
				leftFraction: pfractions left offset: poffsets left;
				bottomFraction: pfractions bottom offset: poffsets bottom;
				rightFraction: pfractions right offset: poffsets right).
	
	bfractions := (0.5@0 corner: 1@0).
	boffsets := (0@80 corner: 0@1100).		
	m addMorph: (PluggableButtonMorph
				on: self 
				getState: nil
				action: #btnCancelClick
				label: #btnCancelLabel)
			fullFrame: (LayoutFrame  identity
				topFraction: bfractions top offset: boffsets top;
				leftFraction: bfractions left offset: boffsets left;
				bottomFraction: bfractions bottom offset: boffsets bottom;
				rightFraction: bfractions right offset: boffsets right).

	^ m
