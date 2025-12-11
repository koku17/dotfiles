#!/bin/bash
[ "$1" = o ] && \
echo -ne "\U$(printf '%x' "$(( 988234 + $(date +%I | sed 's/^0//g') ))")" || \
echo -ne "\U$(printf '%x' "$(( 988222 + $(date +%I | sed 's/^0//g') ))")"
