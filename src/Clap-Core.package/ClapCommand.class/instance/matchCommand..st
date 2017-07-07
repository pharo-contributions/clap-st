matching
matchCommand: aStream
	^ ((subcommands reject: [ :sc | sc canonicalName = aStream peek = false ]) at: 1) matchOn: aStream