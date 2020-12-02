#!/bin/bash

main() {
    echo "Starting Steam..."

    local steam="$(which steam)"
    DISPLAY=:1.0 xinit ${steam} -- vt$XDG_VTNR 
}

main "$@"
