matching
matchOn: aStream
	| word match |
	word := aStream peek.
	(state match: word)
		ifTrue: [ match := self matchWord: aStream next ]
		ifFalse: [ ^ self mismatch ].
	(ClapQueue withAll: positionals) matchesOn: aStream do: [ :each | each recordIn: match ].
	^ match