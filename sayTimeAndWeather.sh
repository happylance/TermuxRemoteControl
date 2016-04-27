#!/usr/bin/env bash
[ -z "$1" ] || { [ $1 == '-v' ] && set -x; }
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
weather="$($DIR/weather.sh)"
time_and_weather="$(date +%I:%M%P), $weather"
echo "$time_and_weather" | tee /dev/tty | "$DIR/termuxRemoteSay.sh" -l zh_CN
