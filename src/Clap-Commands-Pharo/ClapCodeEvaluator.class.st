Class {
	#name : #ClapCodeEvaluator,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'stream'
	],
	#category : #'Clap-Commands-Pharo'
}

{ #category : #'command line' }
ClapCodeEvaluator class >> evaluate [
	<commandline>
	
	^ (ClapCommand withName: 'evaluate')
		description: 'Evaluate a Pharo expression';
		add: ((ClapPositional withName: 'EXPR')
			defaultMeaning: [ Stdio stdin upToEnd ]);
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
	stream
		print: (Smalltalk compiler evaluate: self source);
		lf
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
