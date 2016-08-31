matching
matchOn: aStream
	^ aStream peek = ('--' , self canonicalName)
		ifTrue: [ self matchWithAlias: aStream next ]
		ifFalse: [ self mismatch ]