#!/bin/bash
[ "$1" = o ] && \
printf "\U$(printf '%x' "$(( 988235 + $(date +%I) ))")" || \
printf "\U$(printf '%x' "$(( 988222 + $(date +%I) ))")"
