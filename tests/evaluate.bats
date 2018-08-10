#!/usr/bin/env bats
# -*- mode: bats; -*-

load helpers

@test "evaluate, alias and quoted argument" {
    run silently clap eval '1 class'

    assert_success
    assert_output 'SmallInteger'
}

@test "evaluate, alias and multiple arguments" {
    # beware quotes and other syntactic overlaps with the shell...
    run silently clap eval "'(2+3)'" class printString , String space , '(2+3)' class printString

    assert_success
    assert_output "'ByteString SmallInteger'"
}

@test "evaluate, pipe in and out" {
    output="$( echo 'Object class class class class' | clap evaluate | tr a-z A-Z)"

    assert_success
    assert_output 'METACLASS'
}

@test "evaluate, pipe in" {
    output="$( echo 'Object class class class class' | clap evaluate )"

    assert_success
    assert_output 'Metaclass'
}

@test "evaluate, pipe out" {
    output="$( clap evaluate 'Object class class class class' | cat )"

    assert_success
    assert_output 'Metaclass'
}
