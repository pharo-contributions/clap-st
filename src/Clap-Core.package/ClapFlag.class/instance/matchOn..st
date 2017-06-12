matching
matchOn: aStream
	| word |
	identifiers isEmpty ifTrue: [ NoIdentifiers signal ].
	word := aStream peek.
	^ (identifiers includes: word)
		ifTrue: [ | match |
			match := self matchWord: aStream next.
			(ClapQueue withAll: positionals) matchesOn: aStream do: [ :each | each recordIn: match ].
			^ match ]
		ifFalse: [ self mismatch ]