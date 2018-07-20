"
I represent a nameless command, serving as the root of the command hierarchy and providing default behavior and error handling.
My subcommands are effectively the main commands available to the user.
"
Class {
	#name : #ClapRoot,
	#superclass : #ClapCommand,
	#category : #'Clap-Core-Specifications'
}

{ #category : #matching }
ClapRoot >> canMatchWith: word [
	^ true
]

{ #category : #matching }
ClapRoot >> matchOn: aStream [
	<deprecated: 'remove'>
	^ self newMatchAt: aStream
]

{ #category : #matching }
ClapRoot >> matchPremiseOn: aStream [
	<deprecated: 'remove'>
	^ self newMatchAt: aStream
]

{ #category : #matching }
ClapRoot >> newMatchAt: aStream [
	^ self matchClass specification: self

]
