"
I represent a class which is a command example for doc generation.
"
Class {
	#name : #DocExample,
	#superclass : #Object,
	#category : 'Clap-Core-DocExample'
}

{ #category : #'instance creation' }
DocExample class >> create [
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
