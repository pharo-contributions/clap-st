matching
looksLikeCommand: aStream
	^ (subcommands collect: [ :sc | sc canonicalName ]) includes: aStream peek