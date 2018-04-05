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
