accessing
recognizeFlag: aWord
	^ self specification flags
		detect: [ :flag | flag matchStem: aWord ]
		ifNone: [ self mismatch "invalid flag" ]