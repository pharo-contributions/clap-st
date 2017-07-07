matching
matchPositional: aStream
	| aux |
	pos size = 0
		ifTrue: [ ^ self mismatch ].
	aux := pos at: 1.
	pos remove: aux.
	^ aux matchOn: aStream