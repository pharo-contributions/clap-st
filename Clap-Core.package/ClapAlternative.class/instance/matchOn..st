matching
matchOn: aStream 
	alternatives do: [ :each |
		| match |
		match := each matchOn: aStream.
		match isMismatch
			ifFalse: [ ^ match ] ].
	^ self mismatch