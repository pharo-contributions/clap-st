"
I represent a class which is a simple command example for doc generation.
"
Class {
	#name : #SimpleCommandDocExample,
	#superclass : #Object,
	#category : #'Clap-Examples'
}

{ #category : #'instance creation' }
SimpleCommandDocExample class >> create [
	| doc verbose class |
	doc := ClapCommand withName: 'doc'.
	verbose := ClapFlag withName: 'verbose'.
	verbose description: 'More informations'.
	class := ClapPositional withName: 'class'.
	class description: 'The name of the class to doc'.
	doc
		addPositional: class;
		addFlag: verbose.
	^ doc
]
