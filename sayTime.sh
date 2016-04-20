#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "$(date +%H:%M%P)" | "$DIR/termuxRemoteSay.sh" -l zh_CN

