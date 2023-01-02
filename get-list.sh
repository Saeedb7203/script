#!/bin/bash

SCRIPT_NAME=$0
help () {
    cat << END_USAGE

${SCRIPT_NAME} - Get sandoogh list from this "https://seo.ir/Upload/FileGallery/SeoFiles/133164213738341033_mutualfunds14011003.rar" address.

Usage: just run ${SCRIPT_NAME}

options:
-h | --help              : Show this usage


END_USAGE

    exit 1
}

while getopts 'h:' flag;
do
    case "$flag" in
        h) help exit 0;;
        *) help;;
    esac
done

if [ -d "/home/sandoogh/list" ]; then
    rm -rf /home/sandoogh/list
    mkdir /home/sandoogh/list
else
    mkdir -p /home/sandoogh/list
fi
curl --cacert /home/sandoogh/certs/certificate.crt https://seo.ir/Upload/FileGallery/SeoFiles/133164213738341033_mutualfunds14011003.rar -o /home/sandoogh/list/sandoogh-list.rar

