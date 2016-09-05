matching
matchOn: aStream positionalsFor: match
	[ | arg |
		arg := positionals matchOn: aStream.
		arg addTo: match.
		arg isMismatch
	] whileFalse