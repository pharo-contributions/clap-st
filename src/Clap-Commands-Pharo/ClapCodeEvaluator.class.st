Class {
	#name : #ClapCodeEvaluator,
	#superclass : #Object,
	#instVars : [
		'arguments'
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
				"let's copy all the bytes, twice, because the VM assumes some 8-bit encoding…"
				match word asByteArray utf8Decoded ];
			defaultMeaning: [ :match |
				"in the absence of an explicit argument, read from standard input"
				match context stdin upToEnd ]);
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
ClapCodeEvaluator >> context [
	^ arguments context
]

{ #category : #execution }
ClapCodeEvaluator >> execute [
	| result |
	result := Smalltalk compiler evaluate: self source.
	
	self context hasSessionChanged "we might be waking up after a #save:andQuit:"
		ifFalse: [ self outputStreamDo: [ :out | out print: result; lf ] ]

]

{ #category : #execution }
ClapCodeEvaluator >> outputStreamDo: aBlock [
"	ZnBufferedWriteStream
		on: self context stdout
		do: [ :out | aBlock value: (ZnNewLineWriterStream on: out) ]"
		aBlock value: self context stdout
]

{ #category : #initialization }
ClapCodeEvaluator >> setArguments: args [
	arguments := args
]

{ #category : #initialization }
ClapCodeEvaluator >> source [
	^ (arguments atName: 'EXPR') value
]
