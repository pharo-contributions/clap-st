Extension { #name : #ByteString }

{ #category : #'*Clap-Core-DocWriter' }
ByteString >> addToStream: aString [
	^ self , aString , String cr
]
