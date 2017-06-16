matching
matchOn: aStream
	| word |
	word := aStream peek.
	^ ((self matchShortForm: word) or: (self matchLongForm: word))
		ifTrue: [ | match |
			match := self matchWord: aStream next.
			(ClapQueue withAll: positionals)
				matchesOn: aStream
				do: [ :each | each recordIn: match ].
			^ match ]
		ifFalse: [ self mismatch ]