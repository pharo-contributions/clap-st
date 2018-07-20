Class {
	#name : #ClapCodeEvaluator,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'stream',
		'context'
	],
	#category : #'Clap-Commands-Pharo'
}

{ #category : #'command line' }
ClapCodeEvaluator class >> evaluate [
	<commandline>
	
	^ (ClapCommand withName: 'evaluate')
		description: 'Evaluate a Pharo expression';
		add: ((ClapPositional withName: 'EXPR')
			meaning: [ :match |
				"let's copy all the bytes because the VM wrongly assumed some 8-bit encoding…"
				match word asByteArray utf8Decoded ];
			defaultMeaning: [
				(ZnCharacterReadStream
					on: (ZnBufferedReadStream on: Stdio stdin)
					encoding: 'utf8') upToEnd ]);
		meaning: [ :args | (self with: args)	execute ]
		"save/quit"

]

{ #category : #'instance creation' }
ClapCodeEvaluator class >> with: arguments [
	^ self new
		setArguments: arguments;
		yourself
]

{ #category : #execution }
ClapCodeEvaluator >> execute [
	| result |
	result := Smalltalk compiler evaluate: self source.
	
	context hasSessionChanged "we might be waking up after a #save:andQuit:"
		ifFalse: [ context stdout print: result; lf ]

]

{ #category : #initialization }
ClapCodeEvaluator >> initialize [
	stream := VTermOutputDriver stdout
]

{ #category : #initialization }
ClapCodeEvaluator >> setArguments: args [
	arguments := args
]

{ #category : #initialization }
ClapCodeEvaluator >> source [
	^ (arguments atName: 'EXPR') value
]
