matching
matchesOn: aStream do: aBlock 
	alternatives do: [ :each |
		| match |
		match := each matchOn: aStream.
		match isMismatch
			ifFalse: [ aBlock cull: match ] ]