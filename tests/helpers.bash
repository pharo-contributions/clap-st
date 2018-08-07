## Common definitions and helpers for the rest of the tests

# IF $CLAP is not defined, try the VM & image environment variables defined by
# Smalltalk CI, or generic ones as fallback
: "${CLAP:=$SMALLTALK_CI_VM $SMALLTALK_CI_IMAGE}"
: "${CLAP:=$PHARO_VM $PHARO_IMAGE}"

# As special case, in a fari-based development environment, force the headless VM
[[ "$CLAP" == 'fari run '* ]] && export PHARO=${PHARO%-ui}

function clap() { $CLAP clap "$@"; }

function silently() { "$@" 2>/dev/null; }
function snitch() { tee >(cat >&3); }
function not_on_travis() { [ "$TRAVIS" = true ] || "$@"; }

export CLAP
export -f clap silently snitch

load bats-support/load
load bats-assert/load
