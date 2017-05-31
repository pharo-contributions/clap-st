matching
matchOn: aStream
	^ aStream atEnd
		ifTrue: [ self mismatch ]
		ifFalse: [ self matchWord: aStream next ]