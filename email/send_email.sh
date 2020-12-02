#!/bin/bash

main() {
    local OPTS=$(getopt -o c:b:s: --long csv:,body-file:,subject: -n 'parse-options' -- "$@")

    if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi
    eval set -- "$OPTS"

    while true; do
        case "$1" in
            -c | --csv ) shift ; csv_addresses="$1" ;;
            -b | --body-file ) shift ; body_file="$1" ;;
            -s | --subject ) shift ; subject="$1" ;;
            -- ) [ -z "$csv_addresses" ] || [ -z "$body_file" ] || [ -z "$subject" ] && { echo "Not enough parameters specified!" ; exit; } || break ;;
            * ) break ;;
        esac             
        shift
    done

    while read -r line; do
        mail -s "$subject" $(echo "$line" | awk -F';' '{print $2}') < "$body_file"
    done < $csv_addresses
}

main "$@"
