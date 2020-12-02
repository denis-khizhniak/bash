#!/bin/bash
#
# Install all the dotfiles, creating symlinks to the right directories, exclude exceptions folders

main() {
    local dotfiles=~/Projects/dotfiles  # location of all dotfiles
    local exceptions="alsa"	# exclude these directories (a string, separated by semicolons)

    cd ~
    symlnk_to_dir "$dotfiles" "$exceptions"
}

main "$@"
