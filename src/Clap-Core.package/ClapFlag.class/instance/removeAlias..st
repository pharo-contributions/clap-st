setting
removeAlias: aWord
	(alias includes: aWord) ifFalse: [ AliasNotFoundException signal ].
	alias remove: aWord
	