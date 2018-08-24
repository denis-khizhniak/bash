#!/bin/bash
for i in 128 256 512 1024 2048 4096 8192 16384 32768  
do  
    hdparm -a $i  
    for j in 1 2 4 8 16 32  
    do  
        time dd if=/dev/sda of=/dev/null bs="$j"k  count=10 #1GB / blocksize  
    done  
done  
