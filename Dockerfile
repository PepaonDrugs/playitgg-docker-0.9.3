FROM ubuntu:focal
ARG PLAYIT_USER_UID="1000"
ARG PLAYIT_USER_GID="1000"

RUN mkdir -p /app /secret && \
    groupadd -g ${PLAYIT_USER_GID} playit && \
    useradd playit -u ${PLAYIT_USER_UID} -g ${PLAYIT_USER_GID} && \
    apt-get update && \
    apt-get install ca-certificates -y wget && \
    update-ca-certificates && \
    wget https://github.com/playit-cloud/playit-agent/releases/download/v0.15.18/playit-linux-amd64 -O /app/playit-linux-amd64 && \
    chown -R playit:playit /app && \
    chown -R playit:playit /secret && \
    chmod 0755 /app/playit-linux-amd64
   
WORKDIR '/secret'
USER playit
CMD ../app/playit-linux-amd64 -s
