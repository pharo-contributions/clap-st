Class {
	#name : #ClapPharoVersion,
	#superclass : #Object,
	#instVars : [
		'stream',
		'wantsImage',
		'wantsVirtualMachine'
	],
	#category : #'Clap-Commands-Pharo'
}

{ #category : #versions }
ClapPharoVersion class >> version [
	<commandline>
	^ (ClapCommand withName: 'version')
		description: 'Displays version information.';
		"both flags should be merged into a one-of-many kind of flag"
		addFlag: (ClapFlag withName: 'image');
		addFlag: (ClapFlag withName: 'vm');
		meaning: [ :args |	(self with: args) execute ]
]

{ #category : #'instance creation' }
ClapPharoVersion class >> with: arguments [
	^ self new
		showImage: (arguments atName: #image) value
		virtualMachine: (arguments atName: #vm) value;
		yourself
]

{ #category : #execution }
ClapPharoVersion >> execute [	
	self shouldShowImage
		ifTrue: [ self show: SystemVersion current labeled: 'Image' ].
	self shouldShowVirtualMachine
		ifTrue: [ self show: Smalltalk vm version labeled: 'Virtual machine' ].

	stream flush
]

{ #category : #initialization }
ClapPharoVersion >> initialize [
	stream := VTermOutputDriver stdout
]

{ #category : #testing }
ClapPharoVersion >> shouldShowImage [
	^ wantsVirtualMachine ==> wantsImage
]

{ #category : #testing }
ClapPharoVersion >> shouldShowLabels [
	^ wantsImage == wantsVirtualMachine
]

{ #category : #testing }
ClapPharoVersion >> shouldShowVirtualMachine [
	^ wantsImage ==> wantsVirtualMachine
]

{ #category : #execution }
ClapPharoVersion >> show: versionString labeled: labelString [
	
	self shouldShowLabels ifTrue: [
		stream
			nextPutAll: labelString;
			nextPutAll: ': '; lf ].

	stream
		print: versionString;
		lf
]

{ #category : #initialization }
ClapPharoVersion >> showImage: imageBoolean virtualMachine: vmBoolean [
	wantsImage := imageBoolean.
	wantsVirtualMachine := vmBoolean
]
