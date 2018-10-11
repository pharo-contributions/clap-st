Class {
	#name : #ClapCommandTest,
	#superclass : #ClapParameterizedTest,
	#category : #'Clap-Tests-Unit'
}

{ #category : #accessing }
ClapCommandTest >> classToTest [
	^ ClapCommand
]

{ #category : #tests }
ClapCommandTest >> testAddFlag [
	| flag |
	flag := ClapFlag withName: 'flag'.
	subject add: flag.
	
	subject flags should include: flag
]

{ #category : #tests }
ClapCommandTest >> testAddSubcommand [
	| cmd |
	cmd := ClapCommand withName: 'cmd'.
	subject add: cmd.
	
	subject subcommands should include: cmd
]

{ #category : #tests }
ClapCommandTest >> testMatches [
	| match |
	argv stub peek willReturn: 'foo'.
	argv stub next willReturn: 'foo'.
	argv stub atEnd willReturn: false.
	
	match := subject matchOn: argv.
	
	argv should receive next.
	match should not be isMismatch.
	match word should equal: 'foo'
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSingleFlag [
	| match |
	subject add: (ClapFlag withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' '--bar').
	argv stub next willReturnValueFrom: #('foo' '--bar').
	argv stub atEnd willReturn: false.
		
	match := subject matchOn: argv.
	
	argv should receive next twice.
	match should not be isMismatch.
	match should be includesMatchNamed: 'bar'
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSinglePositional [
	| match |
	subject add: (ClapPositional withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' 'valueforbar').
	argv stub next willReturnValueFrom: #('foo' 'valueforbar').
	argv stub atEnd willReturn: false.

	match := subject matchOn: argv.

	argv should receive atEnd twice.
	argv should receive next twice.
	match should not be isMismatch.
	match word should equal: 'foo'.
	match should be includesMatchNamed: 'bar'.
	(match atName: 'bar') word should equal: 'valueforbar'
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSingleSubcommand [
	| match |
	subject add: (ClapCommand withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' 'bar').
	argv stub next willReturnValueFrom: #('foo' 'bar').
	argv stub atEnd willReturn: false.
	
	match := subject matchOn: argv.
	
	argv should receive next twice.
	argv should receive atEnd twice.
	match should not be isMismatch.
	match should be includesMatchNamed: 'bar'
]

{ #category : #tests }
ClapCommandTest >> testMatchingStopsAtWrongFlag [
	| match |
	subject add: (ClapFlag withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' '--notbar' 'Object').
	argv stub next willReturnValueFrom: #('foo' '--notbar' 'Object').
	argv stub atEnd willReturn: false.

	match := subject matchOn: argv.

	match should be isMatch.
	argv should receive next once
]

{ #category : #tests }
ClapCommandTest >> testMismatchesDifferentAlias [
	| match |
	argv stub peek willReturn: 'fooNOT'.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch
]
