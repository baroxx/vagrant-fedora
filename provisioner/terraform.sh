#!/bin/bash
set -e

dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
dnf install -y terraform

echo -e "finished..."