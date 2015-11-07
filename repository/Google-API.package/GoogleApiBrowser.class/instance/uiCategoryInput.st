user interface
uiCategoryInput
	| m dm |
	
	m := Morph new layoutPolicy: ProportionalLayout new.	
		
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
		fullFrame: (LayoutFrame 
			fractions: (0@0 corner: 0@0)
			offsets: (0@6 corner: 70@30)).
	m color: window color.
		
	m addMorph: (dm := PluggableTextMorph
				on: self
				text: #txtCategory
				accept: #txtCategory:
				readSelection: nil
				menu: nil)
			"frame: (0.0 @ 0.0 extent: 1 @ 0.1)."
			"fullFrame: (LayoutFrame offsets: (0@0 corner: 100@50))."
			fullFrame: (LayoutFrame 
				fractions: (0@0 corner: 1@0)
				offsets: (70@0 corner: 0@30)).
	dm autoAccept: true.
	dm acceptOnCR: true.

	^ m
	