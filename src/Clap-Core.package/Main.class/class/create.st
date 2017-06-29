instance creation
create
	| main ston utf pattern group |
	main := self withName: 'main'.
	ston := STONFlag create.
	utf := UT8Flag create.
	pattern := ClapPattern new.
	group := ClapFlagGroup withName: 'FORMAT'.
	group
		put: ston;
		put: utf.
	pattern add: group.
	main addGroup: group.
	main addPattern: pattern.
	^ main