"
I represent a class which is a complex command example for doc generation.
"
Class {
	#name : #ClapDocumentationExamples,
	#superclass : #Object,
	#category : #'Clap-Examples'
}

{ #category : #'instance creation' }
ClapDocumentationExamples class >> documenterExample [
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

{ #category : #'instance creation' }
ClapDocumentationExamples class >> mineGameExample [
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

{ #category : #'instance creation' }
ClapDocumentationExamples class >> subcommandsExample [
	| main subcommand subsubcommand ston utf |
	main := ClapCommand withName: 'main'.
	ston := (ClapFlag withName: 'ston') addPositional: (ClapPositional withName: 'object').
	ston description: 'Prints at STON format'.
	main addFlag: ston.
	utf := (ClapFlag withName: 'utf8') description: 'Prints at UTF-8 format'.
	main addFlag: utf.
	subcommand := ClapCommand withName: 'git'.
	subcommand addPositional: (ClapPositional withName: 'class').
	subsubcommand := ClapCommand withName: 'man'.
	subcommand addSubcommand: (ClapCommand withName: 'add').
	subcommand addSubcommand: subsubcommand.
	main addSubcommand: subcommand.
	main addSubcommand: (ClapCommand withName: 'other').
	^ main
]
