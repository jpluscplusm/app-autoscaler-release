#!/bin/bash

set -euo pipefail
set -x

ORG_PREFIX=ASATS
SERVICE_PREFIX=autoscaler

ORGS=$(cf orgs | grep -v name | grep ${ORG_PREFIX})
for ORG in $ORGS; do
	set +e
	cf delete-org "$ORG" -f
	# shellcheck disable=SC2181
	if [ "$?" != "0" ]; then
		cf target -o "$ORG"
		SERVICES=$(cf services | grep -v name | grep ${SERVICE_PREFIX} | awk '{print $1}')
		for SERVICE in $SERVICES; do
			cf purge-service-instance "$SERVICE" -f
		done
		cf delete-org -f "$ORG"
	fi
	set -e
done
