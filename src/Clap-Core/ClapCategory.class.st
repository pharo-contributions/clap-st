Class {
	#name : #ClapCategory,
	#superclass : #Object,
	#instVars : [
		'optional',
		'name'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #private }
ClapCategory >> check: aParameter [
	^ self subclassResponsibility 
]
