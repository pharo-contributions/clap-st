matching
matchOn: aStream
	^ aStream peek = self canonicalName
		ifTrue: [ | match |
			match := self matchWithAlias: aStream next.
			self matchOn: aStream flagsFor: match.
			self matchOn: aStream subcommandsFor: match.
			self matchOn: aStream positionalsFor: match.
			match ]
		ifFalse: [ self mismatch ]