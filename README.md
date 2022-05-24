# Description
Mini web server taking the POST from Grafana (as webhook) and sending a Webex message.

# Quick start
```bash
./start-webex-adapter.sh
```

# Testing
* connectivity test: `curl localhost:8050`
* alert test:
  * login and enter a slash instead of the room id to get all available room ids:
  * https://developer.webex.com/docs/api/v1/rooms/get-room-details
  * rename credentials_example.py to credentials.py
  * set WXT_BOT_ACCESS_TOKEN and WXT_BOT_ROOM_ID
  * in Grafana 8.5.3: Alerting->Contact points->New contact point->**Test**
  * Contact point type: Webhook
  * Url: http://localhost:8050/wxt_bot_message

# Dependencies
* Python 3.5+
* PyPi packages: wsgiserver, flask, webexteamssdk
* optional: Docker

# Forked from / Thanks to
* Phil Bridges: https://github.com/phbridge/WebExTeams-Grafana-Alerting

# EULA
This software is provided as is and with zero support level.
