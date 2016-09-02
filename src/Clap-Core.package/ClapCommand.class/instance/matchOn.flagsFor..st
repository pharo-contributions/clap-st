matching
matchOn: aStream flagsFor: aMatch
	[ aStream atEnd ] whileFalse: [
		| matchingFlag |
		flags
			detect: [ :each |
				matchingFlag := each matchOn: aStream.
				matchingFlag isMismatch not ]
			ifFound: [ matchingFlag addTo: aMatch ]
			ifNone: [ ^ self ] ]