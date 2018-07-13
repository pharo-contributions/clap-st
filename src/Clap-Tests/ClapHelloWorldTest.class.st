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
		addFlag: (ClapFlag withName: 'shout');
		addPositional: (ClapPositional withName: 'who')

]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testHello [
	| match |
	match := hello match: #('hello').

	match should not be isMismatch.
	match should not be includesKey: 'shout'.
	match should not be includesKey: 'who'.
	match rootMatch should be: match

]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testHelloWorld [
	| match |
	match := hello match: #('hello' 'world').

	match should not be isMismatch.
	match should not be includesKey: 'shout'.
	match should be includesKey: 'who'.
	(match atName: 'who') word should equal: 'world'.
	(match atName: 'who') rootMatch should be: match
]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testLanguageFlag [
	| match lang |
	lang := ClapPositional withName: 'language'.
	hello addFlag: ((ClapFlag withName: 'lang')
		addPositional: lang;
		meaning: [ :flag | (flag at: lang) value]).

	match := hello match: #('hello' 'monde' '--lang' 'fr' '--shout').

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'.
	(match atName: 'who') word should equal: 'monde'.
	match should be includesKey: 'lang'.
	(match atName: 'lang') should be includesKey: 'language'.
	(match atName: 'lang') value should equal: 'fr'.
	((match atName: 'lang') at: lang) rootMatch should be: match.
]

{ #category : #tests }
ClapHelloWorldTest >> testRunInContext [
	hello stub.

	(ClapContext with: hello)
		activateWith: #('hello' 'context').
		
	hello should receive matchOn: Any.

]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testShouting [
	| match |
	match := hello match: #('hello' '--shout').

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should not be includesKey: 'who'
]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testShoutingAfterthought [
	| match |
	match := hello match: #('hello' 'world' '-s').

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'
]

{ #category : #'tests - matching' }
ClapHelloWorldTest >> testShoutingWorld [
	| match |
	match := hello match: #('hello' '--shout' 'world').

	match should not be isMismatch.
	match should be includesKey: 'shout'.
	match should be includesKey: 'who'
]
