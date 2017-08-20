utility
exitSuccess
"This method exits successfully."
	self hasSessionChanged
		ifTrue: [ ^ self ].
	Exit signalSuccess 