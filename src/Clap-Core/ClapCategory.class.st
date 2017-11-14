Class {
	#name : #ClapCategory,
	#superclass : #Object,
	#instVars : [
		'optional',
		'name',
		'parameter'
	],
	#category : 'Clap-Core-Parameters'
}

{ #category : #'instance creation' }
ClapCategory class >> withName: aName [
	^ self new name: aName
]

{ #category : #setting }
ClapCategory >> asOptional [
	optional := true
]

{ #category : #private }
ClapCategory >> check: aParameter [
	^ self subclassResponsibility 
]

{ #category : #doc }
ClapCategory >> doc [
	Stdio stdout << self docName;lf
]

{ #category : #doc }
ClapCategory >> docAsOptional [
	^ '[' , self name ,  ']'
]

{ #category : #doc }
ClapCategory >> docName [
	^ optional
		ifTrue: [ self docAsOptional ]
		ifFalse: [ self name ]
]

{ #category : #initialization }
ClapCategory >> initialize [
	optional := false
]

{ #category : #accessing }
ClapCategory >> name [
	^ name
]

{ #category : #setting }
ClapCategory >> name: aName [
	name := aName
]
