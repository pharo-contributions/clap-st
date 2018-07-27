#!/usr/bin/env bats
# -*- mode: bats; -*-

load helpers

@test "hello, no argument" {
    run silently clap hello
    assert_success
    assert_output 'hello, world.'
}

@test "hello, single word" {
    run silently clap hello Pharo
    assert_success
    assert_output 'hello, Pharo.'
}

@test "hello, quoted words" {
    run silently clap hello 'Pharo and friends'
    assert_success
    assert_output 'hello, Pharo and friends.'
}

@test "hello, separate words" {
    skip 'only the first positional is used for now'
    run silently clap hello Pharo friends 'and more'
    assert_success
    assert_output 'hello, Pharo friends and more.'
}

@test "hello shouting, no argument" {
    run silently clap hello -s
    assert_success
    assert_output 'HELLO, WORLD!'

    run silently clap hello --shout
    assert_success
    assert_output 'HELLO, WORLD!'
}

@test "hello shouting, with argument" {
    run silently clap hello -s 'pharo hackers'
    assert_success
    assert_output 'HELLO, PHARO HACKERS!'

    run silently clap hello --shout loudly
    assert_success
    assert_output 'HELLO, LOUDLY!'
}

@test "hello help" {
    run silently clap hello --help
    assert_success
    assert_line --index 0 'Provides greetings'
    assert_line 'Usage: hello [--help] [--shout] [<who>]'
    assert_line 'Parameters:'
    assert_line 'Options:'
}
