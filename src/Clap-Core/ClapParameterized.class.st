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

{ #category : #initialization }
ClapParameterized >> initialize [
	positionals := OrderedCollection new
]

{ #category : #matching }
ClapParameterized >> matchOn: aStream positionalsFor: match [
	positionals do: [ :each | (each matchOn: aStream) addTo: match ]
]
