matching
matchCanonicalName: aStream
	| word |
	word := aStream peek.
	word = (self longForm) ifTrue: [ ^ self matchWord: aStream next ].
	^ self mismatch