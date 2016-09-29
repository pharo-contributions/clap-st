matching
matchOn: aStream
	| word |
	word := aStream peek.
	^ (word = self shortForm or: [ word = self longForm ])
		ifTrue: [ | match |
			match := self matchWord: aStream next.
			(ClapQueue withAll: positionals)
				matchesOn: aStream
				do: [ :each | each recordIn: match ].
			^ match ]
		ifFalse: [ self mismatch ]