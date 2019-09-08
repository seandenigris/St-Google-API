baseline
baseline: spec 
	<baseline>
	
	spec for: #common do: [ 
		spec baseline: 'ZincHTTPComponents' with: [
				spec 
					repository: 'github://svenvc/zinc';
					loads: #('Core' 'SSO-OAuth2') ].
		spec baseline: 'NeoJSON' with: [
				spec 
					repository: 'github://svenvc/NeoJSON';
					loads: #('core') ].
		spec 
			package: 'Google-API' with: [ spec requires: #('ZincHTTPComponents' 'NeoJSON') ] ]
		