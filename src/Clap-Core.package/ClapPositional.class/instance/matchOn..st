matching
matchOn: aStream
	^ (aStream atEnd or: [aStream peek beginsWith: '-'])
		ifTrue: [ self mismatch ]
		ifFalse: [ self matchWord: aStream next ]