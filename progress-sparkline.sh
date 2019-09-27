#!/bin/bash

DEFAULT="Lorem ipsum dolor sit amet, consecteteur adipiscing elit magnis"
TEXT="${@:-$DEFAULT}"
TEXT_LEN=${#TEXT}
SPARK="  ▏▎▍▌▋▊▉"

# Escape sequences:
#	<esc>[nD"		Move cursor n spaces left
#	<esc>[1m		Bright text
#	<esc>[7m		Reverse video
#	<esc>[31m		Red text
#	<esc>[47m		White background
#	<esc>[0m"		End sequence

echo -en '\e[?25l' # Hide cursor

echo -n "$TEXT"
echo -en "\\e[${TEXT_LEN}D"

for ((i = 0; i <= $(((TEXT_LEN - 1) * 8)); i++)); do
	DIV=$((i / 8))
	MOD=$((i % 8))
	if [ $MOD = 0 ]; then
		echo -en "\\e[1;7;31;47m${TEXT:$DIV:1}\\e[0m"
	else
		echo -en "\\e[1;31m${SPARK:$MOD:1}\\e[0m"
		echo -en "\\e[1D"
	fi
	sleep 0.01
done

sleep 0.5
echo -en "\\e[${TEXT_LEN}D"
echo "$TEXT "
echo -en '\e[?25h' # Show cursor

