#!/bin/bash
echo "Input a name of partion that you want to create."
read x
pvcreate -v /dev/$x
echo "Following pv is created succesfully"

