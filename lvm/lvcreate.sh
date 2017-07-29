#!/bin/bash
echo "enter size with the lv name and vg name"
read a
read b
read c
lvcreate -L $a --name $b /dev/$c
echo "the following lv is created"
lvdisplay
