setting
put: aParameter
	(self check: aParameter) ifFalse: [ ^ 0 ].
	parameters add: aParameter 