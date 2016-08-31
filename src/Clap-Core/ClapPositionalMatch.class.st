Class {
	#name : #ClapPositionalMatch,
	#superclass : #Object,
	#instVars : [
		'specification',
		'value'
	],
	#category : 'Clap-Core'
}

{ #category : #'instance creation' }
ClapPositionalMatch class >> of: aPositional value: aString [ 
	^ self new
		specification: aPositional
		value: aString
]

{ #category : #matching }
ClapPositionalMatch >> addTo: aCommandMatch [
	aCommandMatch
		at: specification canonicalName
		put: self
]

{ #category : #testing }
ClapPositionalMatch >> isMismatch [
	^ false
]

{ #category : #accessing }
ClapPositionalMatch >> specification [
	^ specification
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
