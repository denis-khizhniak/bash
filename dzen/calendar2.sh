#!/bin/bash
#
# dzen2 pop-up calendar
# (c) 2007, by Robert Manea
#

TODAY=$(expr `date +'%d'` + 0)
MONTH=`date +'%m'`
YEAR=`date +'%Y'`
LINES=$(cal -m | wc -l)
LINES=$((LINES + 2))

(
#date +'%A, %d %b %Y %H:%M'
date +'^bg(#130F1C) '
date +''
# current month, highlight header and today
cal -m | sed -r -e "1,2 s/.*/^fg(#d6ccdc)&^fg()/"  -e "s/(^| )($TODAY)($| )/\1^bg(#aaa5ad)^fg(#130f1c)\2^fg()^bg()\3/") | dzen2 -x 957 -y 0 -w 200 -h 17 -l $LINES -sa c -p -e 'onstart=uncollapse,hide;button3=exit;' -tw 6 -fn "-*-monospace-*-*-*-*-*-*-*-*-*-*-*-*"
)
