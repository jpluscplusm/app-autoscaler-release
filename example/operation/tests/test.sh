#!/usr/bin/env bash

set -euxo pipefail

cd $(dirname $0)

for YML in *.yml; do
    STEM=${YML%.yml}

    if [ $STEM = "template" ]; then continue; fi

    bosh int template.yml --vars-file $STEM.vars \
    | cue vet template.cue $STEM.before.cue yaml: -

    bosh int template.yml --vars-file $STEM.vars --ops-file $STEM.yml \
    | cue vet template.cue $STEM.after.cue yaml: -

done
