Class {
	#name : #ClapQueueTest,
	#superclass : #TestCase,
	#instVars : [
		'subject',
		'argv',
		'okMatch'
	],
	#category : 'Clap-Tests-Unit'
}

{ #category : #running }
ClapQueueTest >> setUp [
	argv := Mock named: 'argv'.
	okMatch := Mock named: 'match'.
	okMatch stub isMismatch willReturn: false.
	okMatch stub ifMismatch: Any.
	
	subject := ClapQueue new
]

{ #category : #tests }
ClapQueueTest >> testEmptyQueueMismatches [
	| match |
	argv stub atEnd willReturn: false.
	
	match := subject matchOn: argv.
	
	argv should not receive next.
	match should be isMismatch
]

{ #category : #tests }
ClapQueueTest >> testMatchingQueueEmpties [
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
