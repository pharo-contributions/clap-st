doc
generateDoc
	Stdio stdout
		<< 'USAGE:';
		lf;
		crlf.
	patterns
		do: [ :p | 
			Stdio stdout << self canonicalName.
			Stdio stdout << ' '.
			p doc.
			Stdio stdout
				lf;
				crlf ].
	Stdio stdout
		<< '';
		lf;
		crlf.
	groups do: [ :g | g doc ]