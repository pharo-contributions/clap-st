matching
matchOn: aStream
	| match |
	match := argument matchOn: aStream.
	match isMismatch ifTrue: [ ^ self mismatch ].
	^ ClapCompulsoryMatch of: argument with: self canonicalName 