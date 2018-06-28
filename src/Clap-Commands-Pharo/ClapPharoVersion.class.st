Class {
	#name : #ClapPharoVersion,
	#superclass : #Object,
	#instVars : [
		'stream',
		'formats'
	],
	#category : #'Clap-Commands-Pharo'
}

{ #category : #versions }
ClapPharoVersion class >> version [
	<commandline>
	^ (ClapCommand withName: 'version')
		description: 'Displays version information.';
		addFlag: (ClapFlag withName: 'full');
		addFlag: (ClapFlag withName: 'release');
		addFlag: (ClapFlag withName: 'numeric');
		addFlag: (ClapFlag withName: 'hash');
		addFlag: (ClapFlag withName: 'vm');
		meaning: [ :args |	(self with: args) execute ]
]

{ #category : #'instance creation' }
ClapPharoVersion class >> with: arguments [
	^ self new
		setArguments: arguments;
		yourself
]

{ #category : #execution }
ClapPharoVersion >> execute [	
	self formats do: [ :each |
		stream
			nextPutAll: (self perform: each);
			lf ].
	stream flush
]

{ #category : #accessing }
ClapPharoVersion >> formats [
	^ formats ifEmpty: [ #(full) ]
]

{ #category : #formats }
ClapPharoVersion >> full [
	^ SystemVersion current imageVersionString
]

{ #category : #formats }
ClapPharoVersion >> hash [
	^ SystemVersion current commitHash
]

{ #category : #initialization }
ClapPharoVersion >> initialize [
	stream := VTermOutputDriver stdout
]

{ #category : #formats }
ClapPharoVersion >> numeric [
	^ SystemVersion current highestUpdate printString
]

{ #category : #formats }
ClapPharoVersion >> release [
	^ SystemVersion current shortVersionString
]

{ #category : #initialization }
ClapPharoVersion >> setArguments: arguments [
	formats := arguments flags collect: [ :each |
		each specification canonicalName asSymbol ]
]

{ #category : #formats }
ClapPharoVersion >> vm [
	^ Smalltalk vm version
]
