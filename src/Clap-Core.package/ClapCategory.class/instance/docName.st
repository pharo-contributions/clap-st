doc
docName
	^ optional
		ifTrue: [ self docAsOptional ]
		ifFalse: [ self name ]