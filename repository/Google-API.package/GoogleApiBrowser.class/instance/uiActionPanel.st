user interface
uiActionPanel
	| m |
	
	m := Morph new layoutPolicy: ProportionalLayout new.

	" Category label and txtbox "	
	m addMorph: (TextMorph new 
			contents: ' Actions')
		fullFrame: (LayoutFrame 
			fractions: (0@0 corner: 1@0)
			offsets: (0@7 corner: 100@30)).
			
	m addMorph: (self uiCategoryInput)
		fullFrame: (LayoutFrame 
			fractions: (0@0 corner: 1@0)
			offsets: (0@30 corner: 0@60)).
	
	" Generate and Cancel buttons "
	m addMorph: (PluggableButtonMorph
				on: self 
				getState: nil
				action: #btnGenerateClick
				label: #btnGenerateLabel)
			fullFrame: (LayoutFrame 
				fractions: (0@0 corner: 0.5@0)
				offsets: (0@80 corner: 0@110)).
		
	m addMorph: (PluggableButtonMorph
				on: self 
				getState: nil
				action: #btnCancelClick
				label: #btnCancelLabel)
			fullFrame: (LayoutFrame 
				fractions: (0.5@0 corner: 1@0)
				offsets: (0@80 corner: 0@110)).

	^ m
