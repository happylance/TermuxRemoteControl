#!/usr/bin/env bash
config_file="$HOME/.termux_remote_config"
[ -e "$config_file" ] || { echo "Cannot find $config_file file."; exit 1; }
source "$config_file"

ssh -p $remote_port $remote_host "termux-tts-speak $@"
