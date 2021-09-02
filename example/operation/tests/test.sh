#!/usr/bin/env bash

set -uo pipefail

cd "$(dirname $0)"

FAIL=0

for YML in *.yml; do

    STEM="${YML%.yml}"
    if [ "$STEM" = "template" ]; then continue; fi
    echo "# $STEM:"

    echo "  test 1:"
    echo "    input:  template.yml + vars:$STEM.vars + opsfile:none"
    echo "    schema: template.cue + $STEM.before.cue"
    bosh int template.yml --vars-file "$STEM.vars" \
    | cue vet template.cue "$STEM.before.cue" yaml: -
    FAIL=$((FAIL+$?))

    echo "  test 2:"
    echo "    input:  template.yml + vars:$STEM.vars + opsfile:$STEM.yml"
    echo "    schema: template.cue + $STEM.after.cue"
    bosh int template.yml --vars-file "$STEM.vars" --ops-file "$STEM.yml" \
    | cue vet template.cue "$STEM.after.cue" yaml: -
    FAIL=$((FAIL+$?))

done

exit $FAIL
