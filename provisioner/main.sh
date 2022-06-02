#!/bin/bash
set -e

readonly USER_NAME=$1
readonly PASSWORD=$2
readonly KEYMAP=$3    

useradd $USER_NAME
echo $USER_NAME:$PASSWORD | sudo chpasswd
usermod -aG wheel $USER_NAME

dnf -y group install workstation-product-environment
systemctl set-default graphical.target

timedatectl set-timezone Europe/Berlin
localectl set-x11-keymap $KEYMAP

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

dnf -y install maven

echo -e "finished..."