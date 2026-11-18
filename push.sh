#!/bin/bash -xe

# MAKE SURE TO CHECK ALL ERRORS BEFORE PUSHING
# maybe add a confirm dialog here

source .env

# do a basic test
./build.sh
./test.sh

echo Pushing Image

docker push $IMAGE
docker push $IMAGE_ALT1
