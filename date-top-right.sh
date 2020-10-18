#!/bin/bash

# save cursor position, move to row;col, date, restore cursor

DATE="$(date +%F)"
COLUMN=$(($(tput cols) - ${#DATE} + 1))

echo -n "before ->"
echo -en "\e[s\e[1;${COLUMN}H${DATE}\e[u"
echo "<- after"

