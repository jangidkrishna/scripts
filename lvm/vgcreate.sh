#!/bin/bash
echo "enter the lv name followed by the device from which ot is created"
read a
readb
vgcreate $a /dev/$b
echo "following vg is created"
vgdisplay
