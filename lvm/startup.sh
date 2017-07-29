#!/bin/bash
echo "1. Create Physical Volume"
echo "2. Create Volume Group"
echo "3. Create Logical Volume"
echo "4. Create filesystem "
echo "5. mount  filesystem "
echo "Please choose a word [1,2,3,4,5,6]? "
read choice
if [ $choice -eq 1 ] ; then
                        ./pvcreate.sh
                else
                if [ $choice -eq 2 ] ; then
                       ./vgcreate.sh
                else
                if [ $choice -eq 3 ] ; then
                        ./lvcreate.sh
                else
                if [ $choice -eq 4 ] ; then
                        ./mkfs.sh
                else
                if [ $choice -eq 5 ] ; then
                        ./mount.sh
                else
                        echo "Please make a choice between 1-5 !"
                        echo "1. Create Physical Volume"
                        echo "2. Create Volume Group"
                        echo "3. Create Logical Volume"
                        echo "4. Create filesystem"
                        echo "5. mount  filesystem "
                        echo -n "Please choose a word [1,2,3,4,5]? "
                        choice=6
                fi
fi
fi
fi
fi
