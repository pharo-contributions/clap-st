#!/usr/bin/env bats
# -*- mode: bats; -*-

# Get VM & image from CI environment
: ${CLAP:=$SMALLTALK_CI_VM $SMALLTALK_CI_IMAGE}

# As special case for fari-based development environment, force the headless VM
[[ "$CLAP" == 'fari run '* ]] && export PHARO=${PHARO%-ui}

function clap() { $CLAP clap "$@"; }

load bats-support/load
load bats-assert/load

@test "implicit argument" {
    run clap hello
    assert_output 'hello, world.'
}

@test "explicit argument, single word" {
    run clap hello Pharo
    assert_output 'hello, Pharo.'
}

@test "explicit argument, quoted" {
    run clap hello 'Pharo and friends'
    assert_output 'hello, Pharo and friends.'
}

@test "several arguments" {
    skip 'only the first positional is used for now'
    run clap hello Pharo friends 'and more'
    assert_output 'hello, Pharo friends and more.'
}

@test "implicit shouting" {
    run clap hello -s
    assert_output 'HELLO, WORLD!'

    run clap hello --shout
    assert_output 'HELLO, WORLD!'
}

@test "explicit shouting" {
    run clap hello -s 'pharo hackers'
    assert_output 'HELLO, PHARO HACKERS!'

    run clap hello --shout loudly
    assert_output 'HELLO, LOUDLY!'
}

@test "help" {
    run clap hello --help
    assert_line --index 0 'Provides greetings'
    assert_line 'Usage: hello [--help] [--shout] [<who>]'
    assert_line 'Parameters:'
    assert_line 'Options:'
}
