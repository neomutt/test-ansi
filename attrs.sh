#!/bin/bash

# 1 Bold or increased intensity 
# 2 Faint (decreased intensity) Not widely supported.
# 3 Italic Not widely supported. Sometimes treated as inverse.
# 4 Underline 
# 5 Blink
# 7 reverse video swap foreground and background colors
# 8 Conceal Not widely supported.
# 9 Crossed-out Characters legible, but marked for deletion. Not widely supported.
# 21 Double Underline 
# 53 Overline

for i in 1 2 3 4 5 7 8 9 21 53; do
	echo -e "$i \\e[${i}mABCDEFGHIJKLMNOPQRSTUVWXYZ\\e[0m"
  echo
done

# 4:1 Single Underline 
# 4:2 Double Underline
# 4:3 Curly Underline

for i in 1 2 3; do
	echo -e "4:$i \\e[4:${i}mABCDEFGHIJKLMNOPQRSTUVWXYZ\\e[0m"
  echo
  echo -e "58:2::255:0:0 \\e[4:${i}m\\e[58:2::255:0:0mABCDEFGHIJKLMNOPQRSTUVWXYZ\\e[0m"
  echo
  echo -e "58:2::0:255:0 \\e[4:${i}m\\e[58:2::0:255:0mABCDEFGHIJKLMNOPQRSTUVWXYZ\\e[0m"
  echo
  echo -e "58:2::0:0:255 \\e[4:${i}m\\e[58:2::0:0:255mABCDEFGHIJKLMNOPQRSTUVWXYZ\\e[0m"
  echo
done

