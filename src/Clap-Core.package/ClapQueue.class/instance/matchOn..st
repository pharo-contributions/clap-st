matching
matchOn: aStream
	| top arg |
	(self isEmpty or: [ aStream atEnd ])
		ifTrue: [ ^ self mismatch ].
	
	self flag: 'FIXME: should not consume positionals as part of matching the parent'.
	top := stack pop.
	arg := top matchOn: aStream.
	arg ifMismatch: [ stack push: top ].
	^ arg