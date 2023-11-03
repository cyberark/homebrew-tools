#!/usr/bin/env bash

# run tests/test-all.sh in a docker container.
# This is useful for testing locally.

set -euo pipefail

if command -v security &>/dev/null; then
    # on MacOS
    security find-certificate \
      -a -c "CyberArk Enterprise Root CA" \
      -p > cyberark_root.crt
else
    # On linux / Jenkins Agent, don't need the internal
    # ca cert so just create an empty file to save having
    # a conditional in the dockerfil.
    touch cyberark_root.crt
fi

docker build \
    -f tests/Dockerfile \
    -t hbtestimage \
    .

summon docker run \
    --env-file @SUMMONENVFILE \
    --volume "${PWD}:${PWD}" \
    --workdir "${PWD}" \
    hbtestimage
