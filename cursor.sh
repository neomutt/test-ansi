#!/bin/bash

echo -n "Cursor:"
sleep 3
echo

echo -en "\e[?25l"
echo -n "Cursor hidden:"
sleep 3
echo

echo -en "\e[?25h"
echo -n "Cursor visible:"
sleep 3
echo

echo -en "\e[?25h"

