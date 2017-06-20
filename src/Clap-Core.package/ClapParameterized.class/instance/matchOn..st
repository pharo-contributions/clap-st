matching
matchOn: aStream
	| args |
	(self matchCanonicalName: aStream) ifTrue: [ match := self matchWord: aStream next] ifFalse: [ ^ self mismatch ].
	args := self parameters.
	[ aStream atEnd ]
		whileFalse: [ | subMatch |
			subMatch := args matchOn: aStream.
			subMatch isMismatch
				ifTrue: [ ^ self stopMatching ].
			subMatch recordIn: match ].
	^ match