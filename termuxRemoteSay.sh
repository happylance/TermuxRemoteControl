#!/usr/bin/env bash
ssh -F $HOME/.ssh/config htc "termux-tts-speak $@"
