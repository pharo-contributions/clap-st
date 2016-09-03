matching
matchOn: aStream flagsFor: parentMatch
	flags
		matchesOn: aStream
		do: [ :match | match addTo: parentMatch ]
