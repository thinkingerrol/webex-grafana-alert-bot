#!/bin/bash

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
# -e to exit immediately when a command fails
# -u to treat unset variables as an error and exit immediately
# -x to print each command before executing it (so their outputs can be discerned from one another!)
# -o pipefail to avoid ignoring non-zero exit codes from anywhere in a pipeline
set -euxo pipefail

mkdir -p logs

docker run -d \
  --name webex-adapter\
  -v $(pwd):/app \
  -p 8050:8050 \
  ubuntu:jammy-20220428 \
    /app/adapter.sh

# connectivity test: curl localhost:8050
# alert test:
# * login and enter a slash instead of the room id to get all available room ids:
#   * https://developer.webex.com/docs/api/v1/rooms/get-room-details
# * rename credentials_example.py to credentials.py
# * set WXT_BOT_ACCESS_TOKEN and WXT_BOT_ROOM_ID
# * in Grafana 8.5.3: Alerting->Contact points->New contact point->Test
#   * Contact point type: Webhook
#   * Url: http://localhost:8050/wxt_bot_message
