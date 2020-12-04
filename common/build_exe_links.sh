#!/bin/bash
#
# Create symlinks in the 'bin' directory to executable files inside the specified directory
#


find_execs() {
    local path="$1"
    local recursive_str="$2"
    local hidden_str="$3"

    stdbuf -oL find "$(cd "$path"; pwd)" $recursive_str $hidden_str -not -path '*.git*' \( -type f -or -type l \) -executable
}

main() {
    local OPTS=$(getopt -o rRhd --long recursive,accept-hidden,dir -n 'parse-options' -- "$@")

    if [ $? != 0 ]; then
        echo "Failed parsing options." >&2
        exit 1
    fi
    eval set -- "$OPTS"

    local bindir="$HOME"/.bin
    local recursive_str="-maxdepth 1"
    local hidden_str="-not -path '*/\.*'"

    while true; do
        case "$1" in
        -r | -R | --recursive)
            unset recursive_str
            shift
            ;;
        -h | --accept-hidden)
            unset hidden_str
            shift
            ;;
        -d | --dir)
            # Specify bin directory or use default
            local bindir="${2:-~/.bin}"
            shift
            ;;
        --) if [ -d "$2" ] || [ -f "$2" ]; then 
                local path="$2"
                shift 2
                break
            else
                echo "Invalid path!"
                exit
            fi
            ;;
        *) break ;;
        esac
    done

    find_execs "$path" "$recursive_str" "$hidden_str" | xargs -i ln -svf {} "$bindir"
}

main "$@"
