FROM ubuntu:latest

RUN \
    --mount=type=cache,target=/var/cache/apt \
    apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates git curl gcc \
    && apt-get clean
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

CMD ["bash", "-c", "'./tests/test-all.sh'"]
