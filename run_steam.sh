#!/bin/bash

steam="$(which steam)"
DISPLAY=:1.0
echo "starting Steam"
xinit ${steam} -- :1 vt$XDG_VTNR 
