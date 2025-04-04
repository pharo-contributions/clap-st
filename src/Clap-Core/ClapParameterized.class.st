"
I am an abstract class specifying a parameter with nested positional parameters.
"
Class {
	#name : 'ClapParameterized',
	#superclass : 'ClapParameter',
	#instVars : [
		'parameters',
		'positionals',
		'aliases'
	],
	#category : 'Clap-Core-Specification',
	#package : 'Clap-Core',
	#tag : 'Specification'
}

{ #category : 'testing' }
ClapParameterized class >> isAbstract [
	^ self == ClapParameterized
]

{ #category : 'adding' }
ClapParameterized >> add: aParameter [
	parameters
		at: aParameter identifier
		ifPresent: [ :param | self signalIdentifierConflictOf: aParameter with: param ]
		ifAbsentPut: aParameter.
	^ aParameter addTo: self
]

{ #category : 'adding' }
ClapParameterized >> addAll: someParameters [
	someParameters do: [ :each | self add: each ]
]

{ #category : 'adding' }
ClapParameterized >> addPositional: aPositional [
	positionals add: aPositional
]

{ #category : 'accessing' }
ClapParameterized >> aliases [
	^ aliases
]

{ #category : 'initialization' }
ClapParameterized >> aliases: aCollection [
	aliases := aCollection
]

{ #category : 'accessing' }
ClapParameterized >> at: identifierOrSpec [
	^ parameters at: identifierOrSpec asClapIdentifier
]

{ #category : 'accessing' }
ClapParameterized >> at: identifierOrSpec ifAbsent: absentBlock [
	^ parameters at: identifierOrSpec asClapIdentifier
		ifAbsent: absentBlock
]

{ #category : 'accessing' }
ClapParameterized >> at: identifierOrSpec ifPresent: presentBlock [
	^ parameters
		at: identifierOrSpec asClapIdentifier
		ifPresent: presentBlock
]

{ #category : 'accessing' }
ClapParameterized >> at: identifierOrSpec ifPresent: presentBlock ifAbsent: absentBlock [
	^ parameters
		at: identifierOrSpec asClapIdentifier
		ifPresent: presentBlock
		ifAbsent: absentBlock
]

{ #category : 'testing' }
ClapParameterized >> hasAlias: aString [
	^ aString = self canonicalName or: [ self aliases includes: aString ]
	
]

{ #category : 'testing' }
ClapParameterized >> hasPositional [

	^ self positionals notEmpty
]

{ #category : 'initialization' }
ClapParameterized >> initialize [
	super initialize.
	parameters := OrderedDictionary new.
	positionals := OrderedCollection new.
	aliases := #()
]

{ #category : 'accessing' }
ClapParameterized >> matchClass [
	^ ClapNamedMatch
]

{ #category : 'enumerating' }
ClapParameterized >> parametersDo: aBlock [
	positionals do: aBlock
]

{ #category : 'enumerating' }
ClapParameterized >> parametersSelect: selectBlock thenDo: doBlock [
	self parametersDo: [ :each |
		(selectBlock value: each)
			ifTrue: [ doBlock value: each ]
	]
]

{ #category : 'accessing' }
ClapParameterized >> positionals [
	^ positionals
]

{ #category : 'private' }
ClapParameterized >> signalIdentifierConflictOf: newParameter with: currentParameter [
	Error signal: 'Identifier conflict (' , newParameter identifier , ')'
]
