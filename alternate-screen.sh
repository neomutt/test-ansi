#!/bin/bash

echo "Normal screen"
sleep 1
echo -en "\e[?1049h"
echo Alternate screen
sleep 1
echo -en "\e[?1049l"
echo "Normal screen again"

