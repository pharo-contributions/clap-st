matching
matchOn: aStream
	| word |
	word := aStream peek.
	word isNil ifTrue: [ ^ self mismatch ].
	(word beginsWith: '-') ifTrue: [ ^ self mismatch ] ifFalse: [ ^ self matchWord: aStream next ]