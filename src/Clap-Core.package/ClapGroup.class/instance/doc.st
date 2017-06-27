doc
doc
	Stdio stdout
		<< groupName;
		lf.
	Stdio stdout
		<< ':';
		lf;
		crlf.
	parameters do: [ :p | p doc.Stdio stdout crlf ]