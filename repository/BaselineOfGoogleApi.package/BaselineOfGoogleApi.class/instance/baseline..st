baseline
baseline: spec 
	<baseline>
	
	spec for: #common do: [ 
		spec project: 'ZincHTTPComponents' with: [ 
			spec 
				className: 'ConfigurationOfZincHTTPComponents';
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main';
				loads: #('Core' 'SSO-OAuth2');
				versionString: '2.6.2' ].
		spec project: 'Neo-JSON-Core' with: [ 
			spec 
				className: 'ConfigurationOfNeoJSON';
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main';
				versionString: '9' ].
		spec 
			package: 'Google-API' with: [ spec requires: #('ZincHTTPComponents' 'Neo-JSON-Core') ] ]
		