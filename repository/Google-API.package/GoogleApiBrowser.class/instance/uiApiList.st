user interface
uiApiList
	| m |
	
	m := Morph new layoutPolicy: ProportionalLayout new.	
		
	m addMorph: (TextMorph new 
				contents: ' API''s')
			fullFrame: (LayoutFrame 
				fractions: (0@0 corner: 1@0)
				offsets: (0@7 corner: 100@30)).
				
	m addMorph: ((PluggableListMorph
				on: self
				list: #apiNameList
				selected: #apiListIndex
				changeSelected: #apiListIndex:
				menu: #apiListMenu:
				keystroke: #apiListKey:from:)
				enableDragNDrop: false)
			fullFrame: (LayoutFrame 
				fractions: (0@0 corner: 1@1)
				offsets: (0@30 corner: 0@30)).
				
	^ m.
