matching
matchOn: aStream
	^ aStream atEnd
		ifTrue: [ self absent ]
		ifFalse: [ ClapPositionalMatch of: self value: aStream next ]