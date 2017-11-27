#!/bin/sh

TMPDIR=/tmp

if [ -z $1 ] ; then
	echo "Usage: ./update.sh <docker image name> <image tag>"
	exit
fi

if [ -z $2 ] ; then
	echo "Usage: ./update.sh <docker image name> <image tag>"
	exit
fi

docker build -t cadvisor-builder build/

ID=$(docker create cadvisor-builder)

docker cp $ID:/go/src/github.com/google/cadvisor/cadvisor ./cadvisor

docker build -t $1 .
docker tag $1 $1:$2
