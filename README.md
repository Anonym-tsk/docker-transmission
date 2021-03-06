![](https://img.shields.io/badge/Transmission-2.94-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.8-brightgreen.svg) ![](https://img.shields.io/docker/stars/anonymtsk/transmission.svg) ![](https://img.shields.io/docker/pulls/anonymtsk/transmission.svg)

#### Volumes

- /config

#### Environment:

| Environment | Default value |
|-------------|---------------|
| PUID        | 1000          |
| PGID        | 1000          |
| RPC_PORT    | 9091          |
| PEER_PORT   | 51413         |
| USERNAME    | transmission  |
| PASSWORD    | transmission  |

#### Custom usage:

    docker run \
        -d \
        --name transmission \
        -p 9091:9091 \
        -v /your/config:/config \
        -e PUID=1000 \
        -e PGID=1000 \
        -e USERNAME=username \
        -e PASSWORD=password \
        anonymtsk/transmission

#### Compose example:

    transmission:
      image: anonymtsk/transmission
      ports:
        - "8080:9091"
        - "51413:51413"
        - "51413:51413/udp"
      volumes:
        - /your/config:/config
      environment:
        - PUID=1000
        - PGID=1000
        - USERNAME=username
        - PASSWORD=password
      restart: always
