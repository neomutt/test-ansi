#!/bin/bash

STRING="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

for i in {0..50}; do
	echo
done

for k in {0..9}; do
	LINE=$((k+10))
	echo -en "\e[$LINE;10H"
	for j in {0..51}; do
		GREEN=$((k*8 + 70))
		BLUE=$((j * 4))
		echo -en "\e[38;2;120;$GREEN;${BLUE}m"
		echo -n "${STRING:$j:1}"
	done
done

echo -en "\e[0m"
echo
echo
echo

