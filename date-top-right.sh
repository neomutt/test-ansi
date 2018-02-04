#!/bin/bash

# save cursor position, move to row;col, date, restore cursor

DATE="$(date +%F)"
COLUMN=$(tput cols)
COLUMN=$((COLUMN - ${#DATE} + 1))
echo -en "\e[s\e[1;${COLUMN}H${DATE}\e[u"

