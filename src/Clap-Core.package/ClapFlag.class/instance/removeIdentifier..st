setting
removeIdentifier: aWord
	(identifiers includes: aWord) ifFalse: [ IdentifierNotFound signal ].
	identifiers remove: aWord
	