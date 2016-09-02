matching
matchOn: aStream
	| word |
	word := aStream peek.
	^ (word = self shortForm or: [ word = self longForm ])
		ifTrue: [ | match |
			match := self matchWithAlias: aStream next.
			self matchOn: aStream positionalsFor: match.
			^ match ]
		ifFalse: [ self mismatch ]