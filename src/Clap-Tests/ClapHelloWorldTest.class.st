Class {
	#name : #ClapHelloWorldTest,
	#superclass : #TestCase,
	#instVars : [
		'hello'
	],
	#category : 'Clap-Tests-Integration'
}

{ #category : #running }
ClapHelloWorldTest >> setUp [
	hello := (ClapCommand withName: 'hello')
		add: (ClapFlag withName: 'shout');
		add: (ClapPositional withName: 'who')

]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testHello [
	| match |
	match := hello match: #('hello').

	match should not be isMismatch.
	match should not be includesMatchNamed: 'shout'.
	match should not be includesMatchNamed: 'who'
]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testHelloWorld [
	| match |
	match := hello match: #('hello' 'world').

	match should not be isMismatch.
	match should not be includesMatchNamed: 'shout'.
	match should be includesMatchNamed: 'who'.
	(match atName: 'who') word should equal: 'world'.
	(match atName: 'who') parent should be: match
]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testLanguageFlag [
	| match lang |
	lang := ClapPositional withName: 'language'.
	hello add: ((ClapFlag withName: 'lang')
		add: lang;
		meaning: [ :flag | (flag at: lang) value]).

	match := hello match: #('hello' 'monde' '--lang' 'fr' '--shout').

	match should not be isMismatch.
	match should be includesMatchNamed: 'shout'.
	match should be includesMatchNamed: 'who'.
	(match atName: 'who') word should equal: 'monde'.
	match should be includesMatchNamed: 'lang'.
	(match atName: 'lang') should be includesMatchNamed: 'language'.
	(match atName: 'lang') value should equal: 'fr'.
	self flag: 'needs a context'. "((match atName: 'lang') at: lang) context should be: match."
]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testShouting [
	| match |
	match := hello match: #('hello' '--shout').

	match should not be isMismatch.
	match should be includesMatchNamed: 'shout'.
	match should not be includesMatchNamed: 'who'
]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testShoutingAfterthought [
	| match |
	match := hello match: #('hello' 'world' '-s').

	match should not be isMismatch.
	match should be includesMatchNamed: 'shout'.
	match should be includesMatchNamed: 'who'
]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testShoutingWorld [
	| match |
	match := hello match: #('hello' '--shout' 'world').

	match should not be isMismatch.
	match should be includesMatchNamed: 'shout'.
	match should be includesMatchNamed: 'who'
]
