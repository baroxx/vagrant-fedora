#!/bin/bash
set -e

dnf install -y nodejs
npm install -g @angular/cli
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

echo -e "finished..."