#!/bin/bash
apt-get update
apt-get upgrade
apt-get install boinc
echo "enter your email account"
read x
echo "enter your password"
read y
boinccmd --lookup_account http://setiathome.berkeley.edu $x $y | grep account
echo "enter the account key displayed above"
read z
boinccmd --project_attach http://setiathome.berkeley.edu $z
boinccmd --get_tasks
echo "now your boinc account should show your computer "

