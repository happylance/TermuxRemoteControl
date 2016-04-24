#!/usr/bin/env bash
[ -z "$1" ] || { [ $1 == '-v' ] && set -x; }
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
current_temperature=$(/home/ubuntu/software/ansiweather/ansiweather -a false -s false \
    | awk '{if (length($7) > 0)printf("气温%s度", $7)}')
forecast=$(/home/ubuntu/software/ansiweather/ansiweather -a false -f 1)
high_low=$(echo "$forecast" | awk '{print $8}')
high=$(echo "$high_low" | awk -F '/' '{if (length($1) > 0)printf("最高%s度", $1)}')
low=$(echo "$high_low" | awk -F '/' '{if (length($2) > 0)printf("最低%s度", $2)}')
rainy_info=$(echo "$forecast" | grep -q "☔ " && echo "有雨")
sunny_info=$(echo "$forecast" | grep -q "☀" && echo "晴")
weather="$current_temperature, $high, $low, $rainy_info$sunny_info"
time_and_weather="$(date +%H:%M%P), $weather"
echo "$time_and_weather"
echo "$time_and_weather" | "$DIR/termuxRemoteSay.sh" -l zh_CN

