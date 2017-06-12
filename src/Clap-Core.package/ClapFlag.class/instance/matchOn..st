matching
matchOn: aStream
	| word |
	word := aStream peek.
	^ ((word = shortForm or: word = longForm) or: (alias includes: word))
		ifTrue: [ | match |
			match := self matchWord: aStream next.
			(ClapQueue withAll: positionals)
				matchesOn: aStream
				do: [ :each | each recordIn: match ].
			^ match ]
		ifFalse: [ self mismatch ]