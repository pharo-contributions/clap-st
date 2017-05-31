matching
matchCanonicalName: aStream
	| word |
	word := aStream peek.
	word = (self shortForm) ifTrue: [ ^ self matchWord: aStream next ].
	^ self mismatch