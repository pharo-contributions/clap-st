Class {
	#name : #ClapParameterizedMatch,
	#superclass : #ClapMatch,
	#instVars : [
		'arguments'
	],
	#category : 'Clap-Core-Matches'
}

{ #category : #accessing }
ClapParameterizedMatch >> at: canonicalName [
	^ (arguments at: canonicalName) value
]

{ #category : #accessing }
ClapParameterizedMatch >> at: canonicalName put: aMatch [
	arguments
		at: canonicalName
		put: aMatch
]

{ #category : #testing }
ClapParameterizedMatch >> includesKey: canonicalName [
	^ arguments includesKey: canonicalName
]

{ #category : #initialization }
ClapParameterizedMatch >> initialize [
	arguments := Dictionary new
]
