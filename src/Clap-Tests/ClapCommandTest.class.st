Class {
	#name : #ClapCommandTest,
	#superclass : #ClapParameterTest,
	#category : 'Clap-Tests-Unit'
}

{ #category : #accessing }
ClapCommandTest >> classToTest [
	^ ClapCommand
]

{ #category : #tests }
ClapCommandTest >> testMatches [
	| match |
	argv stub peek willReturn: 'foo'.
	argv stub next willReturn: 'foo'.
	argv stub atEnd willReturn: true.
	
	match := subject matchOn: argv.
	
	argv should receive next.
	match should not be isMismatch.
	match word should equal: 'foo'
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSingleFlag [
	| match |
	subject addFlag: (ClapFlag withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' '--bar').
	argv stub next willReturnValueFrom: #('foo' '--bar').
	argv stub atEnd willReturn: true.
		
	match := subject matchOn: argv.
	
	argv should receive next twice.
	match should not be isMismatch.
	match should be includesKey: 'bar'
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSinglePositional [
	| match |
	subject addPositional: (ClapPositional withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' 'valueforbar').
	argv stub next willReturnValueFrom: #('foo' 'valueforbar').
	argv stub atEnd willReturnValueFrom: #(false true).

	match := subject matchOn: argv.

	argv should receive atEnd twice.
	argv should receive next twice.
	match should not be isMismatch.
	match word should equal: 'foo'.
	match should be includesKey: 'bar'. "FIXME not sure about the dictionary protocol"
	(match atName: 'bar') word should equal: 'valueforbar'
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSingleSubcommand [
	| match |
	subject addSubcommand: (ClapCommand withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' 'bar').
	argv stub next willReturnValueFrom: #('foo' 'bar').
	argv stub atEnd willReturn: true.
	
	match := subject matchOn: argv.
	
	argv should receive next twice.
	argv should receive atEnd twice.
	match should not be isMismatch.
	match should be includesKey: 'bar'
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithWrongFlag [
	| match |
	subject addFlag: (ClapFlag withName: 'bar').
	argv stub peek willReturnValueFrom: #('foo' '--notbar' 'Object').
	argv stub next willReturnValueFrom: #('foo' '--notbar' 'Object').
	argv stub atEnd willReturn: false.

	match := subject matchOn: argv.

	match should be isMismatch.

]

{ #category : #tests }
ClapCommandTest >> testMatchingPremise [
	| premiseMatch fullMatch |
	argv stub peek willReturn: 'foo'.
	argv stub next willReturn: 'foo'.
	argv stub atEnd willReturn: true.
	
	premiseMatch := subject matchPremiseOn: argv.
	
	argv should receive next.
	premiseMatch should not be isMismatch.
	premiseMatch specification should be: subject.
	premiseMatch word should equal: 'foo'.
	
	fullMatch := subject with: premiseMatch matchOn: argv.
	
	fullMatch should be: premiseMatch.
	fullMatch should not be isMismatch.
	fullMatch word should equal: 'foo'
]

{ #category : #tests }
ClapCommandTest >> testMismatchesDifferentAlias [
	| match |
	argv stub peek willReturn: 'fooNOT'.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch
]

{ #category : #tests }
ClapCommandTest >> testWrongPremise [
	| match |
	argv stub peek willReturn: 'fooNOT'.
	argv stub next willReturn: 'fooNOT'.
	
	match := subject matchPremiseOn: argv.
	
	argv should not receive next.
	match should be isMismatch
]
