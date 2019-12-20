Class {
	#name : #ClapBookletMonthsCommand,
	#superclass : #Object,
	#category : #'Clap-Examples-Booklet'
}

{ #category : #'command line' }
ClapBookletMonthsCommand class >> commandSpecification [
	<commandline>
	^ (ClapCommand id: #months)
		add: ((ClapPositional id: #start)
		  meaning: [ :m | m word asNumber ];
		  implicitMeaning: [ 1 ]);
		add: ((ClapPositional id: #end)
		  meaning: [ :m | m word asNumber ];
		  implicitMeaning: [ 12 ]);
		meaning: [ :commandMatch | | out start end |
			out := commandMatch context stdout.
			start := (commandMatch at: #start) value.
			end := (commandMatch at: #end) value.
			(start to: end)
				do: [ :each | out << each asString ]
				separatedBy: [ out space ].
			out newLine ]
]

{ #category : #'command line' }
ClapBookletMonthsCommand class >> seqSpecification [
  <commandline>
  ^ (ClapCommand id: #'months-seq')
    add: ((ClapPositional id: #bound)
      multiple: true;
      meaning: [ :m | m word asNumber ]);
    meaning: [ :commandMatch | | out bounds start step end |
      out := commandMatch context stdout.
      bounds := (commandMatch occurrencesOf: #bound) collect: #value.
      end := bounds size >= 1
        ifTrue: [ bounds last ] ifFalse: [ 12 ].
      start := bounds size >= 2
        ifTrue: [ bounds first ] ifFalse: [ 1 ].
      step := bounds size >= 3
        ifTrue: [ bounds second ] ifFalse: [ 1 ].
      (start to: end by: step)
        do: [ :each | out << each asString ]
        separatedBy: [ out space ].
      out newLine ]

]
