Class {
	#name : #ClapPositionalMatch,
	#superclass : #Object,
	#instVars : [
		'positional',
		'value'
	],
	#category : 'Clap-Tests'
}

{ #category : #'instance creation' }
ClapPositionalMatch class >> of: aPositional value: aString [ 
	^ self new
		positional: aPositional
		value: aString
]

{ #category : #matching }
ClapPositionalMatch >> addTo: aCommandMatch [
	aCommandMatch
		at: positional canonicalName
		put: self
]

{ #category : #initialization }
ClapPositionalMatch >> positional: aPositional value: aString [ 
	positional := aPositional.
	value := aString
]

{ #category : #accessing }
ClapPositionalMatch >> value [
	^ value
]
