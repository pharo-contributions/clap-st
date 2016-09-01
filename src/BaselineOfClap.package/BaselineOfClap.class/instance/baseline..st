baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		configuration: 'Mocketry' with: [ spec
			repository: 'http://smalltalkhub.com/mc/dionisiy/Mocketry/main';
			versionString: 'stable' ];

		package: 'Clap-Core';
		package: 'Clap-Tests' with: [ spec requires: #('Clap-Core' 'Mocketry') ] ]