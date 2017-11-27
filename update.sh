#!/bin/sh

TMPDIR=/tmp

help() {
	echo "Usage: ./update.sh <cadvisor version> <docker image name> <image tag>"
	exit
}

if [ -z $1 ] ; then
	echo "Missing cadvisor version"
	help
fi

if [ -z $2 ] ; then
	echo "Missing docker image name"
	help
fi

if [ -z $3 ] ; then
	echo "Missing docker tag"
	help
fi

CADVISOR_VERSION=${1}
IMAGE_NAME=${2}
IMAGE_TAG=${3}

git clone --branch ${CADVISOR_VERSION} https://github.com/google/cadvisor.git ./build/cadvisor
docker build -t cadvisor-builder build/

ID=$(docker create cadvisor-builder)

docker cp $ID:/go/src/github.com/google/cadvisor/cadvisor ./cadvisor

docker build -t ${IMAGE_NAME} .
docker tag ${IMAGE_NAME} ${IMAGE_NAME}:${IMAGE_TAG}
