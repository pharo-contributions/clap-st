matching
matchOn: aStream 
	alternatives
		do: [ :each | | match |
			match := each matchOn: aStream.
			match isMismatch not ifTrue: [ ^ match ] ].
	^ self mismatch