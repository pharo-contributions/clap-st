# clap — Command line argument parser for Pharo
[![Build Status][travis-status]][travis]
[![Coverage Status][coveralls-status]][coveralls]

Named after and inspired by [clap-rs](https://github.com/kbknapp/clap-rs), but
this is an independent implementation.

Currently still in the design discovery phase; tests use [Mocketry](http://smalltalkhub.com/#!/~dionisiy/Mocketry).

### Loading instructions

#### starting from a Pharo image

```smalltalk
Metacello new baseline: 'Clap';
    repository: 'github://cdlm/clap-st/src';
    load.
```

#### starting from the shell

```shell
git clone https://github.com/cdlm/clap-st.git
cd clap-st
curl get.pharo.org/alpha | bash
```
…and then, in the image just downloaded, open a workspace and evaluate:
```smalltalk
Metacello new baseline: 'Clap';
   repository: 'gitlocal://./src';
   load.
```

### Defining and invoking commands

Commands and subcommands are instances of `ClapCommand`. To make a command
accessible from the command line, return it from a class-side factory method
with the `<commandline>` pragma. For instance, here's the *hello, world* defined
in `ClapCommandLineExamples`:

```smalltalk
hello
	"The usual Hello, World command, with a couple options to demonstrate what Clap can do."
	<commandline>

	^ (ClapCommand withName: 'hello')
		description: 'Provides greetings.';
		add: (ClapFlag helpFlag);
		add: ((ClapFlag withName: 'shout')
			description: 'Greet loudly');
		add: ((ClapPositional withName: 'who')
			description: 'Recipient of the greetings';
			defaultMeaning: [ 'world' ]);
		meaning: [ :args |
			args atName: 'help' ifFound: [ :help |
			help value.
				Exit signalSuccess
			].

			self new
				doHelloRecipient: (args atName: 'who') value
				shouting: (args atName: 'shout') value ]
```

For now, Clap installs itself as a named command line handler; e.g., to run the
`hello` example command:

```shell
$PHARO_VM $PHARO_IMAGE clap hello
$PHARO_VM $PHARO_IMAGE clap hello --shout you
```

Commands can also be tested from within the image; running them from an
interactive session will not quit the image, but any output from the command
will still go to the standard output:

```smalltalk
ClapCommandLineExamples hello
	runWith: #('hello' '--help').
```

[travis]: https://travis-ci.org/cdlm/clap-st
[travis-status]: https://travis-ci.org/cdlm/clap-st.svg?branch=master
[coveralls]: https://coveralls.io/github/cdlm/clap-st?branch=master
[coveralls-status]: https://coveralls.io/repos/github/cdlm/clap-st/badge.svg?branch=master

### Contributors

Many thanks to everyone who has contributed to clap in one way or another:

Clément Mastin, Damien Pollet, Rajula Vineet Reddy
