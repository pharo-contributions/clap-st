Class {
	#name : #BaselineOfClap,
	#superclass : #BaselineOf,
	#category : #BaselineOfClap
}

{ #category : #baseline }
BaselineOfClap >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'Okay' with: [ spec repository: 'github://cdlm/okay-st' ];

		package: 'Clap-Core';
		package: 'Clap-CommandLine' with: [ spec requires: #('Clap-Core') ];
		package: 'Clap-Tests' with: [ spec requires: #('Clap-Core' 'Clap-Examples') ];
		package: 'Clap-Okay-Tests' with: [ spec requires: #('Clap-Core' 'Okay') ];
		package: 'Clap-Examples' with: [ spec requires: #('Clap-CommandLine') ];
		package: 'Clap-Commands-Pharo' with: [ spec requires: #('Clap-CommandLine') ];

		group: 'default' with: #(core development);
		group: 'core' with: #('Clap-Core' 'Clap-CommandLine');
		group: 'pharo' with: #('Clap-Commands-Pharo');
		group: 'development' with: #(core pharo 'Clap-Tests' 'Clap-Okay-Tests' 'Clap-Examples') ]
]
