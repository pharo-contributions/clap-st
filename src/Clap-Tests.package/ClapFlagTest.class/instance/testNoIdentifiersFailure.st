tests
testNoIdentifiersFailure
	subject removeIdentifier: '-f'.
	subject removeIdentifier: '--foo'.
	self should: [ subject matchOn: nil ] raise: NoIdentifiers