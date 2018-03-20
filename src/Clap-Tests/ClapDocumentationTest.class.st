Class {
	#name : #ClapDocumentationTest,
	#superclass : #TestCase,
	#category : #'Clap-Tests-Integration'
}

{ #category : #tests }
ClapDocumentationTest >> testHelloShortUsage [
	| command documenter doc |
	command := ClapCommandLineExamples hello.
	documenter := ClapDocumenter new.
	
	doc := documenter explain: command; contents.
	
	self assert: (doc endsWith: OSPlatform current lineEnding).
	self assert: doc lines equals: #(
		'Provides greetings.'
		''
		'Usage: hello [--shout] [<who>]'
	)
]
