#!/bin/bash
#
# Simple calendar for dzen2
#

font="DejaVuSansMono:size=9"
fgcolor="#bbbbbb"
bgcolor="#222222"

echo "$(cal -wm3)" | dzen2 -p -x "500" -y "30" -w "540" -l 7 -sa 'c' -ta 'c' -fn "$font"\
                    -title-name 'popup_calendar' -e 'onstart=uncollapse;button1=exit;button3=exit'
