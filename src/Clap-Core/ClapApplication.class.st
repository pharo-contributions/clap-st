"
I define basic boilerplate for delegating commandline behavior to the instance side, passing the arguments match.

Declare the main commandline in a class-side method, concluding the main meaning block as follows:

somethingCommandline
	<commandline>
	^ (ClapCommand withName: 'something')
		""... description, parameters, etc""
		meaning: [ :args |
			""... preliminary checks""
			(self with: args) execute ]
"
Class {
	#name : #ClapApplication,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'context'
	],
	#category : #'Clap-Core-Specification'
}

{ #category : #'instance creation' }
ClapApplication class >> with: arguments [
	^ self new
		setArguments: arguments;
		yourself
]

{ #category : #accessing }
ClapApplication >> command [
	^ arguments at: #command
]

{ #category : #accessing }
ClapApplication >> context [
	^ context
]

{ #category : #accessing }
ClapApplication >> context: aClapContext [
	context := aClapContext
]

{ #category : #execution }
ClapApplication >> execute [
	self subclassResponsibility
]

{ #category : #execution }
ClapApplication >> executeOrPrintHelp [
	(self hasFlag: #help)
		ifTrue: [ self printHelp. self exitSuccess ]
		ifFalse: [ self execute ]
]

{ #category : #execution }
ClapApplication >> exitSuccess [
	^ self context exitSuccess
]

{ #category : #accessing }
ClapApplication >> flags [ 
	^ arguments at: #flags ifAbsent: [ #() ]
]

{ #category : #testing }
ClapApplication >> hasFlag: anIdentifier [ 
	| flags |
	
	flags := arguments at: #flags ifAbsent: [ ^ false ].
	^ flags includes: anIdentifier
]

{ #category : #execution }
ClapApplication >> outputStreamDo: aBlock [
	aBlock value: self context stdout
]

{ #category : #accessing }
ClapApplication >> positional: aFlagIdentifier [ 
	"Get the value of a positional for the flag with given identifier"
	
	"WARNING: positional does not always have a flag as parent. do not do the check is no flag before positional"
	
	
	^ arguments 
		at: aFlagIdentifier
		ifAbsent: [ 
			arguments 
				at: (ClapPositional idFrom: aFlagIdentifier)
				ifAbsent: [ (self hasFlag: aFlagIdentifier) "not matched if true: flag without positional"
									ifFalse: [ self context 
										defaultValueFor: aFlagIdentifier 
										in: self 
										noneBlock: [ NotFound signal: 'Cannot find ' , aFlagIdentifier ,' flag!' ] ] ] ]
]

{ #category : #execution }
ClapApplication >> printHelp [ 
	(ClapDocumenter on: (ZnCharacterWriteStream on: self context stdout))
				explain: self context specification.
]

{ #category : #initialization }
ClapApplication >> setArguments: args [
	arguments := args
]
