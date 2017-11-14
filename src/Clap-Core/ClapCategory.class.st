Class {
	#name : #ClapCategory,
	#superclass : #Object,
	#category : 'Clap-Core-Parameters'
}

{ #category : #private }
ClapCategory >> check: aParameter [
	^ self subclassResponsibility 
]
