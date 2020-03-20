Class {
	#name : #ClapCommandTest,
	#superclass : #ClapParameterizedTest,
	#category : #'Clap-Tests-Unit'
}

{ #category : #accessing }
ClapCommandTest >> classToTest [
	^ ClapCommand
]

{ #category : #tests }
ClapCommandTest >> testAddFlag [
	| subject flag |
	subject := self namedSubject.
	flag := ClapFlag id: #flag.
	subject add: flag.
	
	self assert: (subject flags includes: flag)
]

{ #category : #tests }
ClapCommandTest >> testAddSubcommand [
	| subject cmd |
	subject := self namedSubject.
	cmd := ClapCommand id: #cmd.
	subject add: cmd.
	
	self assert: (subject subcommands includes: cmd)
]

{ #category : #tests }
ClapCommandTest >> testMatches [
	| subject arg argv ctx match |
	subject := self namedSubject.
	arg := self subjectName copy.
	argv := { arg. #remainder } readStream.
	ctx := Object new.
	
	match := subject matchOn: argv in: ctx.
	
	self deny: match isMismatch.
	self assert: match specification identicalTo: subject.
	self assert: match parent identicalTo: ctx.
	self assert: match word equals: arg.
	self assert: argv next equals: #remainder
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSingleFlag [
	| subject argv args match |
	subject := self namedSubject.
	subject add: (ClapFlag id: #bar).
	args := { self subjectName . '--bar' . #remainder }.
	argv := args readStream.
		
	match := subject matchOn: argv in: (subject activationWith: args).
	
	self deny: match isMismatch.
	self assert: (match includesMatchOf: #bar).
	self assert: argv next equals: #remainder
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSinglePositional [
	| subject args argv match |
	subject := self namedSubject.
	subject add: (ClapPositional id: #bar).
	args := { self subjectName copy. 'valueforbar'. #remainder }.
	argv := args readStream.

	match := subject matchOn: argv in: (subject activationWith: args).

	self deny: match isMismatch.
	self assert: match word equals: self subjectName.
	self assert: (match includesMatchOf: #bar).
	self
		assert: (match at: #bar) word
		equals: 'valueforbar'.
	self assert: argv next equals: #remainder
]

{ #category : #tests }
ClapCommandTest >> testMatchesWithSingleSubcommand [
	| subject args argv match |
	subject := self namedSubject.
	subject add: (ClapCommand id: #bar).
	args := { self subjectName. 'bar'. #remainder }.
	argv := args readStream.
	
	match := subject matchOn: argv in: (subject activationWith: args).
	
	self deny: match isMismatch.
	self assert: (match includesMatchOf: #bar).
	self assert: argv next equals: #remainder
]

{ #category : #tests }
ClapCommandTest >> testMatchingStopsAtWrongFlag [
	| subject args argv badFlag match |
	subject := self namedSubject.
	subject add: (ClapFlag id: #bar).
	badFlag := '--notbar'.
	args := { self subjectName. badFlag }.
	argv := args readStream.

	match := subject matchOn: argv in: (subject activationWith: args).

	self assert: match isMatch.
	self assert: argv next identicalTo: badFlag
]

{ #category : #tests }
ClapCommandTest >> testMismatchesDifferentAlias [
	| subject argv badCommand match |
	subject := self namedSubject.
	badCommand := self subjectName , 'NOT'.
	argv := { badCommand } readStream.
	
	match := subject matchOn: argv in: Object new.
	
	self assert: match isMismatch.
	self assert: argv next identicalTo: badCommand
]
