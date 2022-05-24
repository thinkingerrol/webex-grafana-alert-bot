#!/bin/bash

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
# -e to exit immediately when a command fails
# -u to treat unset variables as an error and exit immediately
# -x to print each command before executing it (so their outputs can be discerned from one another!)
# -o pipefail to avoid ignoring non-zero exit codes from anywhere in a pipeline
set -euxo pipefail

apt-get update
apt-get install -y python3-pip
pip3 install wsgiserver==1.3 flask==2.0.3 webexteamssdk==1.6

python3 /app/WebExTeams-Grafana-Alerting.py &
sleep infinity
