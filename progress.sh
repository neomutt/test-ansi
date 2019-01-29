#!/bin/bash

DEFAULT="Lorem ipsum dolor sit amet, consecteteur adipiscing elit magnis"
TEXT="${@:-$DEFAULT}"
TEXT_LEN=${#TEXT}

# Escape sequences:
#	<esc>[4:1m		Select single underline
#	<esc>[58:2::0:255:0m	Select RGB colour for underline
#	<esc>[0m"		End sequence

echo -en '\e[?25l' # Hide cursor

# Display a coloured underline as a progress meter
for ((i = 0; i <= TEXT_LEN; i++)); do
	echo -en "\\e[4:1m\\e[58:2::0:255:0m${TEXT:0:$i}\\e[0m"
	echo -en "\\e[4:1m\\e[58:2::80:80:80m${TEXT:$i}\\e[0m"
	echo -en "\\e[${TEXT_LEN}D"
	sleep 0.05
done

# Flash the underline as a sign of completion
for ((i = 0; i < 4; i++)); do
	echo -en "$TEXT"
	echo -en "\\e[${TEXT_LEN}D"
	sleep 0.1
	echo -en "\\e[4:1m\\e[58:2::0:255:0m${TEXT}\\e[0m"
	echo -en "\\e[${TEXT_LEN}D"
	sleep 0.1
done

# Restore the plain text
echo "$TEXT"
echo -en '\e[?25h' # Show cursor

