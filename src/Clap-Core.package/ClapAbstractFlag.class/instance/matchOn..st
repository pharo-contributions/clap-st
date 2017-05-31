matching
matchOn: aStream
	| match |
	match := self matchCanonicalName: aStream.
	match isMismatch ifTrue: [ ^ self mismatch ].
	(ClapQueue withAll: positionals)
				matchesOn: aStream
				do: [ :each | each recordIn: match ].
			^ match
	
	 