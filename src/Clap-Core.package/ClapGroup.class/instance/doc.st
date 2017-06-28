doc
doc
	parameters
		do: [ :p | 
			Stdio stdout << name asUppercase.
			Stdio stdout << ':';lf;crlf.
			Stdio stdout << p docName.
			Stdio stdout << '    '.
			Stdio stdout
				<< p description;
				lf;
				crlf ]