Class {
	#name : #ClapParameterTest,
	#superclass : #TestCase,
	#category : #'Clap-Tests-Unit'
}

{ #category : #testing }
ClapParameterTest class >> isAbstract [
	^ self = ClapParameterTest
]

{ #category : #accessing }
ClapParameterTest >> classToTest [
	^ self subclassResponsibility
]

{ #category : #running }
ClapParameterTest >> namedSubject [
	^ self classToTest withName: self subjectName
]

{ #category : #running }
ClapParameterTest >> setUp [
	super setUp.
	subject := self namedSubject
]

{ #category : #running }
ClapParameterTest >> subjectName [
	^ 'foo'
]

{ #category : #tests }
ClapParameterTest >> testCanonicalName [
	self
		assert: self namedSubject canonicalName
		equals: self subjectName
]

{ #category : #tests }
ClapParameterTest >> testIdentifierDerivedFromCanonicalName [
	self
		assert: self namedSubject identifier
		equals: self subjectName asSymbol
]

{ #category : #tests }
ClapParameterTest >> testMismatchesAtEnd [
	| subject argv match |
	subject := self namedSubject.
	argv := #() readStream.
	
	match := subject matchOn: argv.
	
	self assert: match isMismatch.
	self
		assert: match specification
		identicalTo: subject
]
