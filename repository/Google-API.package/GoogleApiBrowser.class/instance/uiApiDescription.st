user interface
uiApiDescription
	| m dm |
	
	m := Morph new layoutPolicy: ProportionalLayout new.
	
	m addMorph: (TextMorph new 
			contents: ' Description')
		fullFrame: (LayoutFrame 
			fractions: (0@0 corner: 1@0)
			offsets: (0@7 corner: 100@30)).
		
	m addMorph: (dm := PluggableTextMorph
			on: self
			text: #selectedApiDescription
			accept: nil
			readSelection: nil
			menu: nil)
		fullFrame: (LayoutFrame 
			fractions: (0@0 corner: 1@1)
			offsets: (0@30 corner: 0@30)).
	dm disable.

	^ m
	