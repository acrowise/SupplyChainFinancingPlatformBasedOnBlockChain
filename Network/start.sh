#!/bin/bash

set -e

echo "===> 设置路径到脚本目录"
basepath=$(cd `dirname $0`; pwd)
cd $basepath

echo "===> 设置docker-compose.yaml使用的环境变量"
if [ -z $1 ]; then
    export IMAGE_TAG=latest
else
    export IMAGE_TAG=$1
fi
export COMPOSE_PROJECT_NAME=supply_chain

echo "===> 启动网络(IMAGE_TAG=${IMAGE_TAG}, COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME})"
docker-compose -f docker-compose.yaml up -d