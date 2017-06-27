doc
doc
	groupList
		do: [ :g | 
			g doc.
			Stdio stdout
				<< ' ';
				lf ].
	Stdio stdout
		<< '';
		crlf