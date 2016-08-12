matching
matchOn: aStream
	^ aStream peek = self canonicalName
		ifTrue: [ | match |
			match := self matchWithAlias: aStream next.
			arguments do: [ :each | (each matchOn: aStream) addTo: match ].
			match ]
		ifFalse: [ self mismatch ]