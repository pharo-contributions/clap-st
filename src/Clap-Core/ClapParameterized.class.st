Class {
	#name : #ClapParameterized,
	#superclass : #ClapParameter,
	#instVars : [
		'positionals'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #testing }
ClapParameterized class >> isAbstract [
	^ self == ClapParameterized
]

{ #category : #adding }
ClapParameterized >> addPositional: aPositional [
	positionals add: aPositional
]

{ #category : #accessing }
ClapParameterized >> atName: specName [
	^ self
		positionalNamed: specName
		ifNone: [ nil ]
]

{ #category : #initialization }
ClapParameterized >> initialize [
	positionals := OrderedCollection new
]

{ #category : #accessing }
ClapParameterized >> positionalNamed: specName ifNone: aBlock [
	^ positionals
		detect: [ :arg | arg canonicalName = specName ]
		ifNone: aBlock
]

{ #category : #accessing }
ClapParameterized >> positionals [
	^ ClapQueue withAll: positionals
]
