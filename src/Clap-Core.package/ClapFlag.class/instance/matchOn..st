matching
matchOn: aStream
	| word |
	word := aStream peek.
	^ (word = self shortForm or: [ word = self longForm ])
		ifTrue: [ self matchWithAlias: aStream next ]
		ifFalse: [ self mismatch ]