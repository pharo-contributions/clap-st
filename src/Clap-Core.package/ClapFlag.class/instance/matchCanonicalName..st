matching
matchCanonicalName: aStream
	| word |
	word := aStream peek.
	^ word = self longForm or: word = self shortForm