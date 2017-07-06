doc
print: category elementsOf: args
	args size > 0
		ifTrue: [ Stdio stdout
				<< category;
				lf.
			args
				do: [ :a | 
					Stdio stdout
						<< a docName;<< '    ';<< a description;
						lf ].
			Stdio stdout lf ]