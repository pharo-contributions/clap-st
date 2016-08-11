matching
matchesOn: aStream
	^ aStream peek = self canonicalName
		ifTrue: [ self matchWithAlias: aStream next ]
		ifFalse: [ self mismatch ]