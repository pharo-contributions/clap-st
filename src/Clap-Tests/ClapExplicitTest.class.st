Class {
	#name : #ClapExplicitTest,
	#superclass : #TestCase,
	#instVars : [
		'subject',
		'specification',
		'word'
	],
	#category : #'Clap-Tests-Unit'
}

{ #category : #running }
ClapExplicitTest >> classToTest [
	^ ClapExplicit
]

{ #category : #running }
ClapExplicitTest >> setUp [
	specification := Mock named: 'spec'.
	word := Mock named: 'word'.
	subject := self classToTest of: specification with: word
]

{ #category : #tests }
ClapExplicitTest >> testAccessing [
	subject specification should be: specification.
	subject word should be: word
]

{ #category : #tests }
ClapExplicitTest >> testAddingToParentAddsByName [
	| parent specName |
	specName := Mock new.
	specification stub canonicalName willReturn: specName.
	parent := Mock named: 'parent'.
	(parent stub recordParameterMatch: subject) willReturnYourself.
	
	subject recordIn: parent.
	
	(parent should receive recordParameterMatch: subject) once
]

{ #category : #tests }
ClapExplicitTest >> testMatchesAreNotMismatches [
	subject isMismatch should be: false.
	subject ifMismatch: [ self fail ]
]

{ #category : #tests }
ClapExplicitTest >> testValue [
	| meaning |
	meaning := Mock new.
	specification stub meaning willReturn: meaning.
	subject value.
	specification should receive meaning.
	meaning should receive cull: subject cull: Any
]
