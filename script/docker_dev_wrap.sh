#!/usr/bin/env zsh

DOCKER_IMAGE="ruby"
DOCKER_IMAGE_VER="3.1.3-alpine3.16"
DOCKER_WORK_D="/app"
DOCKER_APP_D="$(cd $(dirname $0)/..; pwd)"
DOCKER_BUNDLE_PATH="${DOCKER_WORK_D}/.bundle"
DOCKER_CMD=${*[@]:1}

[[ -n $DEBUG ]] && echo "DOCKER_RUN_CMD = \' docker run -it --rm \
    -w $DOCKER_WORK_D \
    -v $DOCKER_APP_D:$DOCKER_WORK_D \
    $DOCKER_IMAGE:$DOCKER_IMAGE_VER \
    $DOCKER_CMD\'"

docker run -it --rm \
    -e BUNDLE_PATH=$DOCKER_BUNDLE_PATH \
    -w $DOCKER_WORK_D \
    -v $DOCKER_APP_D:$DOCKER_WORK_D \
    $DOCKER_IMAGE:$DOCKER_IMAGE_VER \
    /bin/sh -l -c "$DOCKER_CMD"


