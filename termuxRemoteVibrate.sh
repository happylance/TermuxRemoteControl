#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
config_file="$DIR/.config"
[ -e "$config_file" ] || { echo "Cannot find .config file."; exit 1; }
source "$config_file"

ssh -p $remote_port $remote_host 'termux-vibrate'
