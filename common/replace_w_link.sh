#!/bin/bash
#
# Put the file in the specified folder and 
# replace it in the original location with a symlink
#
# Parameters:
#   $1: Path to the file
#   $2: Path to the destination folder


main() {
    local path="$1"
    local dest_dir="${2%/}"

    # Check specified file, exit on error
    if [[ ! -f "$path" ]]; then
        echo "Incorrect file path specified!"
        exit
    fi

    # Check specified folder, try to create if does not exist, exit otherwise
    if [[ ! -d "$dest_dir" ]]; then
        echo mkdir -p "$dest_dir"
    else
        echo "Incorrect directory, or cannot create specified directory!"
        exit
    fi

    # Get the original location of the file
    local original_dir="$( dirname "$path" )"
    [[ "$original_dir" == "." ]] && original_dir="$PWD"

    # Get just the file name
    local filename="$( basename "$path" )"

    mv "$path" "${dest_dir}/${filename}"

    ln -svf "${dest_dir}/${filename}" "${original_dir}/${filename}"
}

main "$@"
