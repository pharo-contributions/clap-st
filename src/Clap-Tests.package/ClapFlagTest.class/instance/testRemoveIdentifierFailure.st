tests
testRemoveIdentifierFailure
	self should: [ subject removeIdentifier: '+F' ] raise: IdentifierNotFound 