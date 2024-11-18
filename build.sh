#!/bin/bash
# 功能: 构建基础镜像
# author：jackyzheng
# modified：2024-07-05
# 

# set env
# now base version is 0.1
# now dev version is 0.1
# now ocr version is 0.1

version=""
type=""
function use_age(){
    echo "sh build.sh"
    echo ""
}

while getopts t:v:h: opt; do
    case $opt in
        t)  type=$OPTARG
            ;;
        v)  version=$OPTARG
            ;;
        h)  use_age
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

if [ -z $version ]; then
    echo "version is empty"
    exit -1
fi

case $type in
    base)
        echo "build base image $version"
        docker build -t base:${version} -f Dockerfile.base .
        ;;
    dev)
        echo "build dev image $version"
        docker build -t dev:${version} -f Dockerfile.dev .
        ;;
    ocr)
        echo "build ocr image $version"
        docker build -t ocr:${version} -f Dockerfile.ocr .
        ;;
    *)
        echo "type error"
        ;;
esac


