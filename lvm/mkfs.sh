#!/bin/bash
echo "choose the file system "
read x
echo "give the name of vg and lv"
read y
read z
mkfs -t $x /dev/$y/$z
ls -lt /dev/$y/$z
