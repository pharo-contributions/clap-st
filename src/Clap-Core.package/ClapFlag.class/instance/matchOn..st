matching
matchOn: aStream
	| word |
	word := aStream peek.
	^ (identifiers includes: word)
		ifTrue: [ | match |
			match := self matchWord: aStream next.
			(ClapQueue withAll: positionals)
				matchesOn: aStream
				do: [ :each | each recordIn: match ].
			^ match ]
		ifFalse: [ self mismatch ]