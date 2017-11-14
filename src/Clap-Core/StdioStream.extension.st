Extension { #name : #StdioStream }

{ #category : #'*Clap-Core-DocWriter' }
StdioStream >> addToStream: aString [
	self nextPutAll: aString;lf
	
]
