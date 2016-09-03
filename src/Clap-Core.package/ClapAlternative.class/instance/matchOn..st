matching
matchOn: aStream 
	self
		matchesOn: aStream
		do: [ :match | ^ match ].
	^ self mismatch