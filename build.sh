#!/bin/bash
# 功能: 构建基础镜像
# author：jackyzheng
# modified：2024-07-05
# 

# set env
base_version=v1
dev_version=v0.1
type=""
function use_age(){
    echo "sh build.sh"
    echo ""
}

while getopts t:h: opt; do
    case $opt in
        t)
            type=$OPTARG
            ;;
        h)
            use_age
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


case $type in
    dev)
        echo "dev"
        docker build -t ocr_dev:${dev_version} -f Dockerfile.dev .
        ;;
    base)
        echo "base"
        docker build -t base:${base_version} -f Dockerfile.base .
        ;;
    *)
        echo "type error"
        ;;
esac


