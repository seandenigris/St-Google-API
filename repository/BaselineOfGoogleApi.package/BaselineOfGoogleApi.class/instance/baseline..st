baseline
baseline: spec 
	<baseline>
	
	spec for: #common do: [ 
		spec for: #GToolkit do: [
			spec baseline: #'ZincHTTPComponents' with: [
				spec 
					repository: 'github://feenkcom/zinc';
					loads: #(#'SSO-OAuth2') ] ].
					
		spec for: #notGToolkit do: [
			spec baseline: #'ZincHTTPComponents' with: [
				spec 
					repository: 'github://svenvc/zinc';
					loads: #(#'SSO-OAuth2') ] ].
					
		spec baseline: #'NeoJSON' with: [
			spec 
				repository: 'github://svenvc/NeoJSON';
				loads: #(#'core') ].
		spec 
			package: #'Google-API' with: [ spec requires: #(#'ZincHTTPComponents' #'NeoJSON') ] ]
		