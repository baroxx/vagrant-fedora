#!/bin/bash
set -e

USER_NAME=$1
su - $USER_NAME -c 'curl -sS https://webinstall.dev/k9s | bash'

echo -e "finished..."