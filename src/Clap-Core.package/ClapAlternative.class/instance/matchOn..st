matching
matchOn: aStream
	alternatives
		do: [ :each | 
			| match |
			match := each matchOn: aStream.
			match isMismatch
				ifFalse: [ ^ match ].
				match mustStop ifTrue: [ ^ self mismatch ] ].
	^ self mismatch