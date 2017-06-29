doc
doc
	Stdio stdout << name asUppercase.
			Stdio stdout
				<< ':';
				lf;
				crlf.
	parameters
		do: [ :p | 
			Stdio stdout << p docName.
			Stdio stdout << '    '.
			Stdio stdout
				<< p description;
				lf;
				crlf ]