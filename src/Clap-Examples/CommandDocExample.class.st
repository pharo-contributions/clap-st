"
I represent a class which is a complex command example for doc generation.
"
Class {
	#name : #CommandDocExample,
	#superclass : #Object,
	#category : #'Clap-Examples'
}

{ #category : #'instance creation' }
CommandDocExample class >> create [
	| player mine move |
	player := ClapCommand withName: 'player'.
	mine := (ClapCommand withName: 'mine')
		addSubcommand: (ClapCommand withName: 'set');
		addSubcommand: (ClapCommand withName: 'remove').
	player addSubcommand: mine.
	move := (ClapCommand withName: 'move') addPositional: (ClapPositional withName: 'x');
		addPositional: (ClapPositional withName: 'y').
	player addSubcommand: move.
	^ player
]
