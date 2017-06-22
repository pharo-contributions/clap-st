matching
matchOn: aStream
	compulsories do: [ :each | | match | match := each matchOn: aStream.
			match isMismatch
				ifFalse: [ compulsories remove: each.^ match ] ].
	alternatives
		do: [ :each | 
			| match |
			match := each matchOn: aStream.
			match isMismatch
				ifFalse: [ ^ match ] ].
	^ self mismatch