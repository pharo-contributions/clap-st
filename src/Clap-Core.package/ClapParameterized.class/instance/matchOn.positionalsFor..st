matching
matchOn: aStream positionalsFor: match
	positionals do: [ :each | (each matchOn: aStream) addTo: match ]