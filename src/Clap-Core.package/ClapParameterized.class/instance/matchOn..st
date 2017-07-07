matching
matchOn: aStream
	| args |
	(self matchCanonicalName: aStream)
		ifTrue: [ match := self matchWord: aStream next ]
		ifFalse: [ ^ self mismatch ].
	args := self parameters.
	pos := positionals deepCopy.
	[ aStream atEnd ]
		whileFalse: [ | submatch |
			(self looksLikeFlag: aStream)
				ifTrue: [ submatch := self matchFlag: aStream ]
				ifFalse: [ (self looksLikeCommand: aStream)
						ifTrue: [ submatch := self matchCommand: aStream ]
						ifFalse: [ submatch := self matchPositional: aStream ] ].
			submatch isMismatch
				ifTrue: [ ^ self stopMatching  ].
			submatch recordIn: match ].
	^ match