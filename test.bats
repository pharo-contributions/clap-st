#!/usr/bin/env bats
# -*- mode: sh; -*-

# Get VM & image from CI environment
: ${CLAP:=$SMALLTALK_CI_VM $SMALLTALK_CI_IMAGE}

# As special case for fari-based development environment, force the headless VM
[[ "$CLAP" == 'fari run '* ]] && export PHARO=${PHARO%-ui}

function clap() { $CLAP clap $@; }

@test "hello" {
    result="$(clap hello)"

    [ "${result}" = 'hello, world.' ]
}
