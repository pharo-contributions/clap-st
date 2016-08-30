Class {
	#name : #ClapScratchTest,
	#superclass : #TestCase,
	#category : 'Clap-Tests-Scratch'
}

{ #category : #tests }
ClapScratchTest >> testFooBarBaz [
	| matches argv |
	argv := Mock named: 'argv'.
	argv stub peek willReturnValueFrom: #('foo' 'bar' 'baz').
	argv stub next willReturnValueFrom: #('foo' 'bar' 'baz').
		
	matches := (ClapCommand withName: 'foo')
		add: (ClapPositional withName: 'one');
		add: (ClapPositional withName: 'two');
		matchOn: argv.
	
	argv should receive next exactly: 3.
	
	matches should not be isMismatch.
	matches alias should equal: 'foo'.
	matches should be includesKey: 'one'.
	(matches at: 'one') should equal: 'bar'.
	matches should be includesKey: 'two'.
	(matches at: 'two') should equal: 'baz'
]

{ #category : #tests }
ClapScratchTest >> testHelloDefault [
	| argv matches |
	argv := Mock named: 'argv'.
	argv stub peek willReturn: 'hello'.
	argv stub next willReturn: 'hello'.
	argv stub atEnd willReturn: true.
	
	matches := (ClapCommand withName: 'hello')
		add: ((ClapPositional withName: 'who')
					default: 'someone');
		matchOn: argv.
	
	argv should receive next once.
	matches should not be isMismatch.
	matches alias should equal: 'hello'.
	(matches at: 'who') value should equal: 'someone'
]
