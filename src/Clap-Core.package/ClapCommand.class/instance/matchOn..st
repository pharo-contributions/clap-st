matching
matchOn: aStream
	| match args |
	aStream peek = self canonicalName
		ifFalse: [ ^ self mismatch ].
	
	match := self matchWord: aStream next.
	self flag: 'FIXME: should build whole alternative/queues for this matching only'.
	args := ClapAlternative new
		add: flags;
		add: subcommands;
		add: positionals.

	[ aStream atEnd ]
		whileFalse: [ (args matchOn: aStream) addTo: match ].

	^ match
