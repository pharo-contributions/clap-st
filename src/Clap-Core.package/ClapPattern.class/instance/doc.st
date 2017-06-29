doc
doc
	groupList
		do: [ :g | 
			Stdio stdout << g docName.
			Stdio stdout << ' ' ].
		Stdio stdout lf