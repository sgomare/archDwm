#!/bin/sh

weatherreport="/tmp/weatherreport"
getforecast() { curl -sf "wttr.in/$LOCATION" > "$weatherreport" || exit 1 ;}

showweather() { printf "%s" "$(sed '16q;d' "$weatherreport" |
	grep -wo "[0-9]*%" | sort -rn | sed "s/^/☔/g;1q" | tr -d '\n')"
sed '13q;d' "$weatherreport" | grep -o "m\\([-+]\\)*[0-9]\\+" | sed 's/+//g' | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " 🥶" $1 "°","🌞" $2 "°"}' ;}

getforecast
showweather
