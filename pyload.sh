#!/bin/bash

IMAGE_NAME=pyload

ACTION=$1

if [ -z "$ACTION" ];
  then
    echo "usage: $0 <build|run|stop|start|remove>";
    exit 1;
fi

_build() {
    #Build
    docker build -t $IMAGE_NAME .
}

_run() {
    #Run
    docker run -d -p 8000:8000 --name $IMAGE_NAME $IMAGE_NAME
}

_start() {
    #Start
    docker start $IMAGE_NAME
}

_stop() {
    #Stop
    docker stop $IMAGE_NAME 
}

_remove() {
    #Remove
    docker rm $IMAGE_NAME 
}

eval _$ACTION
