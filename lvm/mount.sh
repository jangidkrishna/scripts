#!/bin/bash
echo "enter the vg ang lv name"
read a
read b
echo "enter the mount point"
echo "ensure that the mount point exists"
read c
mount /dev/$a/$b $c
echo "following confirms the file system is mounted"
mount | grep $c
