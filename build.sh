#!/bin/bash -i
cd "`dirname ${0}`"
source .env

docker-compose down
docker-compose up -d --build

docker image tag $IMAGE $IMAGE_ALT1 
