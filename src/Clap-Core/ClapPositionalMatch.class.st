Class {
	#name : #ClapPositionalMatch,
	#superclass : #ClapMatch,
	#instVars : [
		'value'
	],
	#category : 'Clap-Core-Matches'
}

{ #category : #'instance creation' }
ClapPositionalMatch class >> of: aPositional value: aString [ 
	^ self new
		specification: aPositional
		value: aString
]

{ #category : #initialization }
ClapPositionalMatch >> specification: anArgumentSpec value: aString [ 
	specification := anArgumentSpec.
	value := aString
]

{ #category : #accessing }
ClapPositionalMatch >> value [
	^ value
]
