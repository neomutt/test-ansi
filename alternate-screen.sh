#!/bin/bash

echo -e "\e[1;31mNormal screen\e[0m"
sleep 1
echo -en "\e[?1049h"
echo -e "\e[1;4;32mAlternate screen\e[0m"
sleep 1
echo -en "\e[?1049l"
echo -e "\e[1;34mNormal screen again\e[0m"

