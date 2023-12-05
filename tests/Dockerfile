FROM ubuntu

RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt-get update \
    && apt-get -y install ca-certificates git curl gcc
COPY cyberark_root.crt /usr/local/share/ca-certificates
RUN update-ca-certificates
COPY ./tests tests
RUN CI=true ./tests/install-brew.sh

CMD bash -c './tests/test-all.sh'
