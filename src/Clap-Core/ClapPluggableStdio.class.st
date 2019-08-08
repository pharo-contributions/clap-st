Class {
	#name : #ClapPluggableStdio,
	#superclass : #Object,
	#instVars : [
		'in',
		'out',
		'err'
	],
	#category : #'Clap-Core-Activation'
}

{ #category : #'instance creation' }
ClapPluggableStdio class >> onByteArrays [
	^ self new
		initializeInput: #[] readStream
		output: #[] writeStream
		error: #[] writeStream
]

{ #category : #initializing }
ClapPluggableStdio >> initializeInput: inputStream output: outputStream error: errorStream [
	in := inputStream.
	out := outputStream.
	err := errorStream
]

{ #category : #accessing }
ClapPluggableStdio >> stderr [
	^ err
]

{ #category : #accessing }
ClapPluggableStdio >> stdin [
	^ in
]

{ #category : #accessing }
ClapPluggableStdio >> stdout [
	^ out
]
