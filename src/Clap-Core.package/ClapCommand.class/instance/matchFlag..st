matching
matchFlag: aStream
	flags do: [ :f | | submatch | submatch := f matchOn: aStream.
		submatch isMismatch ifFalse: [ ^ submatch ] ].
	^ self mismatch