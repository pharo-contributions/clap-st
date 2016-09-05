matching
matchOn: aStream
	| match args |
	aStream peek = self canonicalName
		ifFalse: [ ^ self mismatch ].
	
	match := self matchWithAlias: aStream next.
	args := ClapAlternative new
		add: flags;
		add: subcommands;
		add: positionals.

	[ aStream atEnd ]
		whileFalse: [ (args matchOn: aStream) addTo: match ].

	^ match
