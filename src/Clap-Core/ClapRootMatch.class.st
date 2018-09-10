Class {
	#name : #ClapRootMatch,
	#superclass : #ClapCommandMatch,
	#category : #'Clap-Core-Activation'
}

{ #category : #enumerating }
ClapRootMatch >> wordsDo: aBlock [
	self flag: 'todo: duplicates from super'.
	arguments do: [ :each | each wordsDo: aBlock ]
]
