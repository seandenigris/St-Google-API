user interface
uiCategoryInput
	| m dm fractions offsets mfractions moffsets |
	
	m := Morph new layoutPolicy: ProportionalLayout new.	
	fractions := (0@0 extent: 0@0).
	offsets := (0@6 extent: 70@30).	
	"m addMorph: (PluggableButtonMorph
				on: self 
				getState: nil
				action: #btnDiscoverClick
				label: #btnDiscoverLabel)
			fullFrame: (LayoutFrame 
				fractions: (0@0 corner: 0@0)
				offsets: (0@0 corner: 100@30))."
	m addMorph: (StringMorph new 
			contents: ' Category:')
		fullFrame: (LayoutFrame  identity
				topFraction: fractions top offset: offsets top;
				leftFraction: fractions left offset: offsets left;
				bottomFraction: fractions bottom offset: offsets bottom;
				rightFraction: fractions right offset: offsets right).
	m color: window color.
		
	mfractions := (0@0 corner: 1@0).
	moffsets := (70@0 corner: 0@30).		
	m addMorph: (dm := PluggableTextMorph
				on: self
				text: #txtCategory
				accept: #txtCategory:
				readSelection: nil
				menu: nil)
			"frame: (0.0 @ 0.0 extent: 1 @ 0.1)."
			"fullFrame: (LayoutFrame offsets: (0@0 corner: 100@50))."
			fullFrame: (LayoutFrame  identity
				topFraction: mfractions top offset: moffsets top;
				leftFraction: mfractions left offset: moffsets left;
				bottomFraction: mfractions bottom offset: moffsets bottom;
				rightFraction: mfractions right offset: moffsets right).
	dm autoAccept: true.
	dm acceptOnCR: true.

	^ m
	