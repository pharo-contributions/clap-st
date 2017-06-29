doc
docName
	^ optional
		ifTrue: [  self docAsOptional ]
		ifFalse: [ name ]