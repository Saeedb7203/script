#!/bin/bash

SCRIPT_NAME=$0
help () {
    cat << END_USAGE

${SCRIPT_NAME} - Get ssl certificate of a url

Usage: ${SCRIPT_NAME} <options>

options:
-u | --url               : Pass an input link(https)
-h | --help              : Show this usage

Examples:
========
$ ${SCRIPT_NAME} -u <your link>

END_USAGE

    exit 1
}
if [[ $# -eq 0 ]] ; then
    help
    exit 0
fi

while getopts 'u:h:' flag;
do

    case "$flag" in
        u) url=${OPTARG};;
        h) help exit 0;;
        *) help;;
    esac
done

if [ -d "/home/sandoogh/certs" ]; then
    rm -rf /home/sandoogh/certs
    mkdir /home/sandoogh/certs
else
    mkdir -p /home/sandoogh/certs
fi
echo | openssl s_client -servername $url -connect $url:443 |  sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /home/sandoogh/certs/certificate.crt
