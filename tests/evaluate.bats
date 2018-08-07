#!/usr/bin/env bats
# -*- mode: bats; -*-

load helpers

@test "evaluate, argument" {
    run silently clap evaluate '1 class'

    assert_success
    assert_output 'SmallInteger'
}

@test "evaluate, pipe in and out" {
    output="$( echo 'Object class class class class' | clap evaluate | tr a-z A-Z)"

    assert_success
    not_on_travis assert_output 'METACLASS' # waiting for https://github.com/pharo-project/pharo/pull/1671
}

@test "evaluate, pipe in" {
    output="$( echo 'Object class class class class' | clap evaluate )"

    assert_success
    not_on_travis assert_output 'Metaclass' # waiting for https://github.com/pharo-project/pharo/pull/1671
}

@test "evaluate, pipe out" {
    output="$( clap evaluate 'Object class class class class' | cat )"

    assert_success
    assert_output 'Metaclass'
}
