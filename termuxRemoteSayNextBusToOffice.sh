#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
config_file="$DIR/.config"
[ -e "$config_file" ] || { echo "Cannot find .config file."; exit 1; }
source "$config_file"

nextBusToOffice=$($HOME/dev/NextBus/3T.sh -e)
[ -z "$nextBusToOffice" ] && nextBusToOffice="No current prediction"
echo "$nextBusToOffice" | ssh -p $remote_port $remote_host 'termux-tts-speak -' 

