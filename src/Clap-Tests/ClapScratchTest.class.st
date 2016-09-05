Class {
	#name : #ClapScratchTest,
	#superclass : #TestCase,
	#instVars : [
		'argv',
		'subject',
		'okMatch'
	],
	#category : 'Clap-Tests-Scratch'
}

{ #category : #running }
ClapScratchTest >> setUp [
	argv := Mock named: 'argv'.
	okMatch := Mock named: 'match'.
	okMatch stub isMismatch willReturn: false.
	okMatch stub ifMismatch: Any.
	
	subject := ClapQueue new
]

{ #category : #tests }
ClapScratchTest >> testEmptyQueueMismatches [
	| match |
	argv stub atEnd willReturn: false.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch
]

{ #category : #tests }
ClapScratchTest >> testMatchingQueueEmpties [
	| match arg |
	argv stub atEnd willReturn: false.
	argv next willReturn: 'foo'.
	arg := ClapPositional withName: 'arg'.
	subject push: arg.
	
	match := subject matchOn: argv.
	
	argv should receive next.
	match should not be isMismatch.
	subject should be isEmpty
]
