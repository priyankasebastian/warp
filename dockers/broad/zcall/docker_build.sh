#!/bin/bash
set -e

# Update version when changes to Dockerfile are made
DOCKER_IMAGE_VERSION=4.0.1
TIMESTAMP=$(date +"%s")
DIR=$(cd $(dirname $0) && pwd)

# Registries and tags
GCR_URL="us.gcr.io/broad-gotc-prod/zcall"
DOCKERHUB_URL=""
IMAGE_TAG="$DOCKER_IMAGE_VERSION-$TIMESTAMP"

# ZCall Version
ZCALL_VERSION="zCall_Version1.3_AutoCall"

# Necessary tools and help text
TOOLS=(docker gcloud)
HELP="$(basename "$0") [-h|--help] [-v|--version] [-t|tools] -- script to build the ZCall image and push to GCR & Dockerhub

where:
    -h|--help Show help text
    -v|--version Zip version of Zcall to use (default: $ZCALL_VERSION)
    -t|--tools Show tools needed to run script
    "

function main(){
    for t in "${TOOLS[@]}"; do which $t >/dev/null || ok=no; done
        if [[ $ok == no ]]; then
            echo "Missing one of the following tools: "
            for t in "${TOOLS[@]}"; do echo "$t"; done
            exit 1
        fi

    while [[ $# -gt 0 ]]
    do 
    key="$1"
    case $key in
        -v|--version)
        ZCALL_VERSION="$2"
        shift
        shift
        ;;
        -h|--help)
        echo "$HELP"
        exit 0
        ;;
        -t|--tools)
        for t in "${TOOLS[@]}"; do echo $t; done
        exit 0
        ;;
        *)
        shift
        ;;
    esac
    done

    echo "building and pushing GCR Image - $GCR_URL:$IMAGE_TAG"
    docker build --no-cache -t "$GCR_URL:$IMAGE_TAG" \
        --build-arg ZCALL_VERSION="$ZCALL_VERSION" $DIR 
    docker push "$GCR_URL:$IMAGE_TAG"

    # echo "tagging and pushing Dockerhub image - $DOCKERHUB_URL:$IMAGE_TAG"
    # docker tag "$GCR_URL:$IMAGE_TAG" "$DOCKERHUB_URL:$IMAGE_TAG"
    # docker push "$DOCKERHUB_URL:$IMAGE_TAG"

    echo "$GCR_URL:$IMAGE_TAG" >> "$DIR/docker_versions.tsv"
    echo "done"
}

main "$@"
