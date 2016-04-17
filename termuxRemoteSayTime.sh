#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
"$DIR/termuxRemoteSay.sh" "$(date +%H:%M%P)"

