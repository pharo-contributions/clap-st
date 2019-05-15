Class {
	#name : #ClapTestRunner,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'suite'
	],
	#category : #'Clap-Commands-Pharo'
}

{ #category : #'command line' }
ClapTestRunner class >> test [
	<commandline>
	^ (ClapCommand withName: 'test')
		add: ClapFlag forHelp;
		add: ((ClapFlag withName: 'xml')
			description: 'Output results in JUnit-compatible XML format');
		add: ((ClapFlag withName: 'tap')
			description: 'Output results in Test-Anything Protocol format');
		add: ((ClapPositional withName: 'PKG')
			description: 'Run tests from packages matching this pattern';
			multiple: true;
			meaning: [ :match | match word asRegex ]);
		meaning: [ :args |
			args atName: 'help' ifFound: [ :help |
				help value; exitSuccess ].
			args validateAll.
			
			(self with: args) execute ]
]

{ #category : #'instance creation' }
ClapTestRunner class >> with: arguments [
	^ self new
		setArguments: arguments;
		yourself
]

{ #category : #private }
ClapTestRunner >> buildSuite [
	| packages |
	packages := self packages.
	suite := TestSuite named: packages size printString , ' packages'.
	packages
		do: [ :each | suite addTest: (SUnitSuiteBuilder new visit: each) ]
]

{ #category : #accessing }
ClapTestRunner >> context [
	^ arguments context
]

{ #category : #execution }
ClapTestRunner >> execute [
	| result |
	self outputStreamDo: [ :out |
		self suite
			when: TestAnnouncement
			do: [ :ann | out nextPutAll: ann test name; lf ].
		result := [ self suite run ]
			ensure: [ self suite unsubscribe: TestAnnouncement ].
		out print: result; lf
	].
	
	self context exitSuccess
]

{ #category : #execution }
ClapTestRunner >> outputStreamDo: aBlock [
	aBlock value: self context stdout
]

{ #category : #accessing }
ClapTestRunner >> packagePatterns [
	^ arguments
		occurrencesNamed: 'PKG'
		collect: #value
]

{ #category : #accessing }
ClapTestRunner >> packages [
	^ self packagePatterns
		flatCollect: [ :regex |
			RPackage organizer packages
				select: [ :package | regex matches: package name ]]
		as: Set
]

{ #category : #execution }
ClapTestRunner >> runPackage: package [
	| suite |
	suite := TestSuite named: package name.
	package definedClasses do: [ :each |
		each isTestCase
			ifTrue: [ each addToSuiteFromSelectors: suite ] ].
	^ self runSuite: suite
		 
]

{ #category : #initialization }
ClapTestRunner >> setArguments: args [
	arguments := args
]

{ #category : #accessing }
ClapTestRunner >> suite [
	suite ifNil: [ self buildSuite ].
	^ suite
]