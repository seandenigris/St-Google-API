user interface
uiApiList
	| m fractions offsets mfractions moffsets |
	
	m := Morph new layoutPolicy: ProportionalLayout new.	
	fractions := (0@0 extent: 0@0).
	offsets := (0@0 extent: 100@30).	
	m addMorph: (TextMorph new 
				contents: ' API''s')
			fullFrame: (LayoutFrame  identity
				topFraction: fractions top offset: offsets top;
				leftFraction: fractions left offset: offsets left;
				bottomFraction: fractions bottom offset: offsets bottom;
				rightFraction: fractions right offset: offsets right).
	
	mfractions := (0@0 corner: 1@1).
	moffsets := (0@30 corner: 0@30).			
	m addMorph: ((PluggableListMorph
				on: self
				list: #apiNameList
				selected: #apiListIndex
				changeSelected: #apiListIndex:
				menu: #apiListMenu:
				keystroke: #apiListKey:from:)
				enableDragNDrop: false)
			fullFrame: (LayoutFrame  identity
				topFraction: mfractions top offset: moffsets top;
				leftFraction: mfractions left offset: moffsets left;
				bottomFraction: mfractions bottom offset: moffsets bottom;
				rightFraction: mfractions right offset: moffsets right).
				
	^ m.
