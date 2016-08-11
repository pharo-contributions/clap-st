Class {
	#name : #ClapScratchTest,
	#superclass : #TestCase,
	#category : 'Clap-Tests'
}

{ #category : #tests }
ClapScratchTest >> testHello [
	| hello argv matches |
	hello := ClapCommand withName: 'hello'.
	hello canonicalName should equal: 'hello'.
	
	argv := Mock named: 'argv'.
	argv stub peek willReturn: 'hello'.
	argv stub next willReturn: 'hello'.
	
	matches := hello matchesOn: argv.
	
	argv should receive next.
	matches should not be isMismatch.
	matches alias should equal: 'hello'
]

{ #category : #tests }
ClapScratchTest >> testHelloMismatch [
	| hello argv matches |
	hello := ClapCommand withName: 'hello'.
	
	argv := Mock named: 'argv'.
	argv stub peek willReturn: 'foo'.
	
	matches := hello matchesOn: argv.
	
	argv should not receive next.
	matches should be isMismatch
]

{ #category : #tests }
ClapScratchTest >> testHelloWorld [
	<expectedFailure>
	| matches argv |
	argv := Mock named: 'argv'.
	argv stub peek willReturnValueFrom: #('hello' 'world').
	argv stub next willReturnValueFrom: #('hello' 'world').
		
	matches := (ClapCommand withName: 'hello')
		add: (ClapPositional withName: 'who');
		matchesOn: argv.
	
	matches should not be isMismatch.
	matches should be includesKey: 'who'.
	(matches at: 'who') should equal: 'world'
]
