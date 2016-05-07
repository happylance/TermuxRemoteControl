#!/usr/bin/env bash

symbol_to_text () {
    symbol="$1"
    case "$symbol" in 
        ☀) echo "晴"
            ;;
        ☔ ) echo "有雨"
            ;;
        ☁ ) echo "多云"
            ;;
        ❄) echo "有雪"
            ;;
        ⚡) echo "有雷雨"
            ;;
        *) ;;
    esac
}

[ -z "$1" ] || { [ $1 == '-v' ] && set -x; }
current_temperature=$(/home/ubuntu/software/ansiweather/ansiweather -a false -s false \
    | awk '{if (length($7) > 0)printf("气温%s度", $7)}')
today=$(date '+%a %b %d')
forecast=$(/home/ubuntu/software/ansiweather/ansiweather -a false -f 2 | tr '>-' '\n' | grep "$today")
high_low=$(echo "$forecast" | awk '{print $4}')
low_to_high=$(echo "$high_low" | awk -F '/' '{if (length($2) > 0)printf("%s度到%s度", $2, $1)}')
generic_info_symbol=$(echo "$forecast" | awk '{print $6}')
generic_info=$(symbol_to_text $generic_info_symbol)
weather="$current_temperature, $low_to_high, $generic_info"
echo "$weather"
