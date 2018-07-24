#!/usr/bin/env bats
# -*- mode: bats; -*-

# Get VM & image from CI environment
: ${CLAP:=$SMALLTALK_CI_VM $SMALLTALK_CI_IMAGE}

# As special case for fari-based development environment, force the headless VM
[[ "$CLAP" == 'fari run '* ]] && export PHARO=${PHARO%-ui}

function clap() { $CLAP clap "$@"; }

@test "implicit argument" {
    run clap hello
    [ "$output" = 'hello, world.' ]
}

@test "explicit argument, single word" {
    run clap hello Pharo
    [ "$output" = 'hello, Pharo.' ]
}

@test "explicit argument, quoted" {
    run clap hello 'Pharo and friends'
    [ "$output" = 'hello, Pharo and friends.' ]
}

@test "several arguments" {
    skip 'only the first positional is used for now'
    run clap hello Pharo friends 'and more'
    [ "$output" = 'hello, Pharo friends and more.' ]
}

@test "implicit shouting" {
    run clap hello -s
    [ "$output" = 'HELLO, WORLD!' ]

    run clap hello --shout
    [ "$output" = 'HELLO, WORLD!' ]
}

@test "explicit shouting" {
    run clap hello -s 'pharo hackers'
    [ "$output" = 'HELLO, PHARO HACKERS!' ]

    run clap hello --shout loudly
    [ "$output" = 'HELLO, LOUDLY!' ]
}

@test "help" {
    run clap hello --help
    [ "${lines[0]}" = 'Provides greetings' ]
    [ "${lines[1]}" = 'Usage: hello [--help] [--shout] [<who>]' ]
}
