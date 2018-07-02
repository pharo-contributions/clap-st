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
	^ (ClapCommand withName: 'doc')
		add: ((ClapPositional withName: 'class')
			description: 'The name of the class to doc');
		add: ((ClapFlag withName: 'verbose')
			description: 'More informations');
		yourself
]

{ #category : #'instance creation' }
ClapDocumentationExamples class >> mineGameExample [
	^ (ClapCommand withName: 'player')
		add: ((ClapCommand withName: 'mine')
			add: (ClapCommand withName: 'set');
			add: (ClapCommand withName: 'remove');
			yourself);
		add: ((ClapCommand withName: 'move')
			add: (ClapPositional withName: 'x');
			add: (ClapPositional withName: 'y');
			yourself);
		yourself
]

{ #category : #'instance creation' }
ClapDocumentationExamples class >> subcommandsExample [
	^ (ClapCommand withName: 'main')
		add: ((ClapFlag withName: 'ston')
			description: 'Prints at STON format';
			add: (ClapPositional withName: 'object'); yourself);
		add: ((ClapFlag withName: 'utf8')
			description: 'Prints at UTF-8 format');
		add: ((ClapCommand withName: 'git')
			add: (ClapPositional withName: 'class');
			add: (ClapCommand withName: 'add');
			add: (ClapCommand withName: 'man');
			yourself);
		add: (ClapCommand withName: 'other');
		yourself

]
