#!/bin/bash
#
# Install all etcs, creating symlinks to the right directories

main() {
    local dir=~/Projects/etc    # directory with all tracked etcs

    cd /etc
    symlnk_to_dir "$dir"
}

main "$@"
