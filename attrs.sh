#!/bin/bash

# 1 Bold or increased intensity 
# 2 Faint (decreased intensity) Not widely supported.
# 3 Italic Not widely supported. Sometimes treated as inverse.
# 4 Underline 
# 7 reverse video swap foreground and background colors
# 8 Conceal Not widely supported.
# 9 Crossed-out Characters legible, but marked for deletion. Not widely supported.

for i in 1 2 3 4 7 8 9; do
	echo -e "$i \e[${i}mABCDEFGHIJKLMNOPQRSTUVWXYZ\e[0m"
done

