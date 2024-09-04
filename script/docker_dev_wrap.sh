#!/usr/bin/env zsh


PRJ_ROOT="$(cd $(dirname $0)/..; pwd)"

DOCKER_IMAGE_NAME="activity_monitor_rb"
DOCKER_IMAGE_VER="latest"
DOCKER_WORK_D="/app"
DOCKER_APP_D="$(cd $(dirname $0)/..; pwd)"
DOCKER_BUNDLE_PATH="${DOCKER_WORK_D}/.bundle"
DOCKER_CMD=${*[@]:1}
HOST_USER_ID="$(id -u)"
HOST_GROUP_ID="$(id -g)"

if [[ $(docker image inspect $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VER > /dev/null; echo $?) -gt 0 ]] then
    echo "Docker image not found. Building an image"

    docker buildx build \
        --build-arg HOST_GROUP_ID=$HOST_GROUP_ID \
        --build-arg HOST_USER_ID=$HOST_USER_ID \
        -f $PRJ_ROOT/.config/docker/Dockerfile \
        -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VER \
        .

    echo "Finished building docker image."
fi

[[ -n $DEBUG ]] && echo "DOCKER_RUN_CMD = \' docker run -it --rm \
    -w $DOCKER_WORK_D \
    -v $DOCKER_APP_D:$DOCKER_WORK_D \
    $DOCKER_IMAGE:$DOCKER_IMAGE_VER \
    $DOCKER_CMD\'"

docker run -it --rm \
    -e BUNDLE_PATH=$DOCKER_BUNDLE_PATH \
    -w $DOCKER_WORK_D \
    -v $DOCKER_APP_D:$DOCKER_WORK_D \
    $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VER \
    /bin/sh -l -c "$DOCKER_CMD"


