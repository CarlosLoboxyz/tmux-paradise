#!/bin/sh

while IFS= read -r line1; do
    if [ "$1" = "$(awk -F ',' '{print $1}' <<< $line1)" ]; then
        while IFS= read -r line2; do
            if [ "$(awk -F ',' '{print $2}' <<< $line1)" = "$(awk -F ',' '{print $1}' <<< $line2)" ]; then
                printf "#[fg=$(awk -F ',' '{print $3}' <<< $line1)]$(awk -F ',' '{print $2}' <<< $line2) "
                exit 0
            fi
        done < "$(dirname "$0")/icons"
    fi
done < "$(dirname "$0")/icons-definitions"

# Print default symbol if there is no other available.
printf " "
