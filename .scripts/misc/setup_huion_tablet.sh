#!/usr/bin/env bash

id=$(xsetwacom list | grep stylus | egrep -Eo '[0-9]{1,2}')

xsetwacom set $id MapToOutput DP-2
xsetwacom set 16 area 0 0 40640 25400   # 80%

# Keys?
xsetwacom set "HUION Huion Tablet Pad pad" button 9 key Ctrl Z
# xsetwacom --set '16' Button 1 "key a"
# xsetwacom --set '16' Button 2 "key b"
# xsetwacom --set '16' Button 3 "key c"
# xsetwacom --set '16' Button 8 "key d"
# xsetwacom --set '16' Button 9 "key e"
# xsetwacom --set '16' Button 10 "key f"
# xsetwacom --set '16' Button 11 "key g"
# xsetwacom --set '16' Button 12 "key h"
# xsetwacom --set '16' Button 13 "key i"
# xsetwacom --set '16' Button 14 "key j"
# xsetwacom --set '16' Button 15 "key k"
# xsetwacom --set '16' Button 16 "key l"
