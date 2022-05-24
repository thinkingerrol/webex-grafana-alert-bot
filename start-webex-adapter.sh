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
