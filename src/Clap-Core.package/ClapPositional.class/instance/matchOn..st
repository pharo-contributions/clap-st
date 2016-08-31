matching
matchOn: aStream
	^ aStream atEnd
		ifTrue: [ self mismatch ]
		ifFalse: [ ClapPositionalMatch of: self value: aStream next ]