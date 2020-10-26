#!/bin/bash

## Escape sequences:
##	<esc>]2;TEXT<bel>	Set terminal title

SPACE="░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
SOLID="██████████████████████████████████████████████████"

for ((i = 0; i <= 50; i++)); do
	echo -en "\033]2;${SOLID:0:$i}${SPACE:0:$((50-i))} $((i*2))%\007";
	sleep 0.1
done

sleep 0.5
