doc
doc
	groupList
		do: [ :g | 
			g doc.
			Stdio stdout << ' ' ].
	Stdio stdout
		<< '';lf;
		crlf