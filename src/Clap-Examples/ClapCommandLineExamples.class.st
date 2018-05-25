"
Examples and demos of Clap commands (see class side, protocol commandline).

Arbitrary command instances can be run as do-its, e.g.:
	ClapCommandLineExamples hello runWith: #('hello' 'Pharo')

Commands registered in the system (returned from a class-side method with the <commandline> pragma) can also be invoked from the host system's command line:
	$PHARO_VM $IMAGE clap hello Pharo

"
Class {
	#name : #ClapCommandLineExamples,
	#superclass : #Object,
	#category : #'Clap-Examples'
}

{ #category : #commandline }
ClapCommandLineExamples class >> git [
	<commandline>
	^ (ClapCommand withName: 'git')
		description: 'The stupid content tracker';
		addSubcommand: ((ClapCommand withName: 'add')
			description: 'Add file contents to the index');
		addSubcommand: ((ClapCommand withName: 'branch')
			description: 'List, create, or delete branches');
		addSubcommand: ((ClapCommand withName: 'clone')
			description: 'Clone a repository into a new directory');
		addSubcommand: ((ClapCommand withName: 'commit')
			description: 'Record changes to the repository');
		addSubcommand: ((ClapCommand withName: 'init')
			description: 'Create an empty Git repository or reinitialize an existing one');
		addSubcommand: ((ClapCommand withName: 'remote')
			description: 'Manage set of tracked repositories';
			addSubcommand: (ClapCommand withName: 'add');
			addSubcommand: (ClapCommand withName: 'remove');
			addSubcommand: (ClapCommand withName: 'set-url'));
		addSubcommand: ((ClapCommand withName: 'status')
			description: 'Show the working tree status')
]

{ #category : #commandline }
ClapCommandLineExamples class >> hello [
	<commandline>
	^ (ClapCommand withName: 'hello')
		description: 'Provides greetings.';
		addFlag: ((ClapFlag withName: 'shout')
			description: 'Greet loudly');
		addPositional: ((ClapPositional withName: 'who')
			description: 'Recipient of the greetings';
			defaultMeaning: [ 'world' ]);
		meaning: [ :args |
			args atName: 'help' ifFound: [
				(ClapDocumenter on: (ClapDocumentationFormatter on: args context))
					explain: args parent specification.
				Exit signalSuccess
			].
				
			self new
				doHelloRecipient: (args atName: 'who') value
				shouting: (args atName: 'shout') value ]
]

{ #category : #running }
ClapCommandLineExamples >> doHelloRecipient: who shouting: shouting [
	| message |
	message := 'hello, ' , who.
	
	VTermOutputDriver stdout
		<< (shouting
			ifTrue: [ message asUppercase , '!' ]
			ifFalse: [ message , '.' ]);
		lf
]
