FROM ubuntu

RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt-get update \
    && apt-get -y install ca-certificates git curl gcc
COPY cyberark_root.crt /usr/local/share/ca-certificates
RUN update-ca-certificates
COPY ./tests tests

# We need a non-root user that can install to the linuxbrew dir
ARG USER=tester
RUN useradd -m -N $USER && \
    mkdir -p /home/linuxbrew && \
    chown -R ${USER}:0 /home/linuxbrew
USER ${USER}
RUN CI=true ./tests/install-brew.sh

CMD bash -c './tests/test-all.sh'
