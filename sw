#!/usr/bin/env bash

# Usage:
# sw
#  - starts a stopwatch
#  - press any alphanumeric key to stop


function finish {
  tput cnorm # Restore cursor
  exit 0
}

trap finish EXIT

# Use GNU date if possible as it's most likely to have nanoseconds available
hash gdate 2>/dev/null
USE_GNU_DATE=$?
function datef {
    if [[ $USE_GNU_DATE == "0" ]]; then
        gdate "$@"
    else
        date "$@"
    fi
}

# Display nanoseconsd only if supported
if datef +%N | grep -q N 2>/dev/null; then
    DATE_FORMAT="+%M:%S"
else
    DATE_FORMAT="+%M:%S.%N"
    NANOS_SUPPORTED=true
fi

tput civis # hide cursor
START_TIME=$(datef +%s)

# GNU date accepts the input date differently than BSD
if [[ $USE_GNU_DATE == "0" ]]; then
    DATE_INPUT="--date now-${START_TIME}sec"
else
    DATE_INPUT="-v-${START_TIME}S"
fi

read -r -n 1 # wait for one character
STOPWATCH=$(TZ=UTC datef $DATE_INPUT $DATE_FORMAT | ( [[ "$NANOS_SUPPORTED" ]] && sed 's/.\{7\}$//' || cat ) )
printf "\rTime: %s\n" $STOPWATCH
