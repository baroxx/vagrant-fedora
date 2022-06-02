#!/bin/bash
set -e

systemctl disable mcelog.service

readonly USER_NAME=$1
dnf -y update
chown -R $USER_NAME:$USER_NAME /home/$USER_NAME
reboot

echo -e "finished..."