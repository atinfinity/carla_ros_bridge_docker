#!/bin/sh

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --gpus 0 --privileged --rm -it \
           --volume=$XSOCK:$XSOCK:rw \
           --volume=$XAUTH:$XAUTH:rw \
           --volume=$HOME:$HOME \
           --shm-size=1gb \
           --env="XAUTHORITY=${XAUTH}" \
           --env="DISPLAY=${DISPLAY}" \
           --env=TERM=xterm-256color \
           --env=QT_X11_NO_MITSHM=1 \
           --net=host \
           -u "melodic"  \
           carla:0.9.8 \
           bash
