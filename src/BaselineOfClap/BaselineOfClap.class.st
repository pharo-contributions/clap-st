Class {
	#name : #BaselineOfClap,
	#superclass : #BaselineOf,
	#category : 'BaselineOfClap'
}

{ #category : #baseline }
BaselineOfClap >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry' ];

		package: 'Clap-Core';
		package: 'Clap-Tests' with: [ spec requires: #('Clap-Core' 'Mocketry') ];

		group: 'default' with: #(development);
		group: 'core' with: #('Clap-Core');
		group: 'development' with: #('Clap-Tests') ]
]
