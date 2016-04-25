#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
nextBusToOffice=$($HOME/dev/NextBus/3T.sh -e)
[ -z "$nextBusToOffice" ] && { echo "No current prediction" | "$DIR/termuxRemoteSay.sh"; exit 0; }

_say_if_in_range() {
    #[[ "$1" -le 10 && "$1" -ge 4 ]] && { echo "Next 3T will be ready in $1 minutes" | "$DIR/termuxRemoteSay.sh"; exit 0; }
    [[ "$1" -le 100 && "$1" -ge 4 ]] && { echo "下趟车还有${1}分钟就要到了" | "$DIR/termuxRemoteSay.sh" -l zh_CN; exit 0; }
}

first=$(echo "$nextBusToOffice" | awk '{print $1}')
_say_if_in_range $first

second=$(echo "$nextBusToOffice" | awk '{print $2}')
[ -z "$second" ] || _say_if_in_range $second
