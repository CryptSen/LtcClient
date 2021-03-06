#!/bin/sh

if ! [ -n "$1" ] ; then
    echo "Please provide directory for blockchain data."
    exit 1
fi

docker stop litecoin
docker rm litecoin

chown -R dockeruser "$1"

docker run --restart=always -d --name litecoin \
    --cap-drop all \
    -p 8532:8532 \
    -v "$1":/opt/graphsense/data \
    -it litecoin
docker ps -a
