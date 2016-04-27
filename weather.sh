#!/usr/bin/env bash
[ -z "$1" ] || { [ $1 == '-v' ] && set -x; }
current_temperature=$(/home/ubuntu/software/ansiweather/ansiweather -a false -s false \
    | awk '{if (length($7) > 0)printf("气温%s度", $7)}')
today=$(date '+%a %b %d')
forecast=$(/home/ubuntu/software/ansiweather/ansiweather -a false -f 2 | tr '>-' '\n' | grep "$today")
high_low=$(echo "$forecast" | awk '{print $4}')
low_to_high=$(echo "$high_low" | awk -F '/' '{if (length($2) > 0)printf("%s度到%s度", $2, $1)}')
rainy_info=$(echo "$forecast" | grep -q "☔ " && echo "有雨")
sunny_info=$(echo "$forecast" | grep -q "☀" && echo "晴")
weather="$current_temperature, $low_to_high, $rainy_info$sunny_info"
echo "$weather"
