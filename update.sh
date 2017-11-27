#!/bin/sh

TMPDIR=/tmp

if [ -z $1 ] ; then
	echo "Usage: ./update.sh <docker image name>"
	exit
fi

docker build -t cadvisor-builder build/

ID=$(docker create cadvisor-builder)

docker cp $ID:/go/src/github.com/google/cadvisor/cadvisor ./cadvisor

docker build -t $1
