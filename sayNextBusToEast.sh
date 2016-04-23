#!/bin/bash

set -e
[ -z "$1" ] || {
    [ $1 == '-v' ] && set -x
}
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
nextBusToEast=$($HOME/dev/NextBus/3THomeEast.sh -e)
[ -z "$nextBusToEast" ] && { echo "No current prediction" | "$DIR/termuxRemoteSay.sh"; exit 0; }

_say_if_in_range() {
    #[[ "$1" -le 15 && "$1" -ge 4 ]] && { echo "Next 3T will be ready in $1 minutes" | "$DIR/termuxRemoteSay.sh"; exit 0; }
    [[ "$1" -le 15 && "$1" -ge 4 ]] && { echo "下趟车还有${1}分钟就要到了" | "$DIR/termuxRemoteSay.sh" -l zh_CN; exit 0; }
}

first=$(echo "$nextBusToEast" | awk '{print $1}')
_say_if_in_range $first

second=$(echo "$nextBusToEast" | awk '{print $2}')
[ -z "$second" ] || _say_if_in_range $second
