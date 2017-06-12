tests
testRemoveAliasFailure
	self should: [ subject removeAlias: '+F' ] raise: AliasNotFoundException 