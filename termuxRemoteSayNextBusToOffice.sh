#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
nextBusToOffice=$($HOME/dev/NextBus/3T.sh -e)
[ -z "$nextBusToOffice" ] && nextBusToOffice="No current prediction"
echo "$nextBusToOffice" | "$DIR/termuxRemoteSay.sh"

