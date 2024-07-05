# Playit Docker image

[Playit](https://playit.gg/) tunnel service in a Docker Image

![Docker Pulls](https://img.shields.io/docker/pulls/pepaondrugs/playitgg-docker)

## Usage



Docker 
```yaml
docker run -d \
  --name playit-docker \
  -v playit-volume:/app \
  pepaondrugs/playitgg-docker:latest
```

for arm please use
```yaml
docker run -d \
  --name playit-docker \
  -v playit-volume:/app \
  pepaondrugs/playitgg-docker:arm
```

for armv7 please use
```yaml
docker run -d \
  --name playit-docker \
  -v playit-volume:/app \
  pepaondrugs/playitgg-docker:armv7   
```

If you wanted to change the user and/or group, you will need to use an arg
```yaml
docker run -d \
  --name playit-docker \
  -v playit-volume:/app \
  --build-arg="PLAYIT_USER_UID=1000" \
  --build-arg="PLAYIT_USER_GID=1000" \
  pepaondrugs/playitgg-docker:latest   
```

Docker compose

```yaml
version: "3"

services:
  playit-docker:
    container_name: "playit-docker"
    image: pepaondrugs/playitgg-docker:latest
    volumes:
        - playit-volume:/app
    restart: unless-stopped
volumes:
    playit-volume:
        external: false
```

Or Docker compose for arm

```yaml
version: "3"

services:
  playit-docker:
    container_name: "playit-docker"
    image: pepaondrugs/playitgg-docker:arm
    volumes:
        - playit-volume:/app
    restart: unless-stopped
volumes:
    playit-volume:
        external: false
```

Or Docker compose for armv7 so 32bit


```yaml
version: "3"

services:
  playit-docker:
    container_name: "playit-docker"
    image: pepaondrugs/playitgg-docker:armv7
    volumes:
        - playit-volume:/app
    restart: unless-stopped
volumes:
    playit-volume:
        external: false
```


Docker Compose to change the user and/or group


```yaml
version: "3"

services:
  playit-docker:
    build:
      args:
        PLAYIT_USER_UID: 1000
        PLAYIT_USER_GID: 1000
    container_name: "playit-docker"
    image: pepaondrugs/playitgg-docker:latest
    volumes:
        - playit-volume:/app
    restart: unless-stopped
volumes:
    playit-volume:
        external: false
```

If you want to claim the agent have a look at the log
```bash
docker logs playit-docker
```
```bash
link=https://playit.gg/claim/#######
```

If anything doesnt work dont hesitate to open a issue
