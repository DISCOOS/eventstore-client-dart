#!/usr/bin/env bash

if [ -z "$1" ]
  then
    root="$PWD/certs/"
  else
    root="$1/certs/"
fi

mkdir -p "$root"

chmod 0755 "$root"

rm -rf /tmp/ca /tmp/node

docker pull eventstore/es-gencert-cli:1.0.1

docker run --rm --volume "$root:/tmp" --user "$(id -u):$(id -g)" eventstore/es-gencert-cli:1.0.1 create-ca -out /tmp/ca

docker run --rm --volume "$root:/tmp" --user "$(id -u):$(id -g)" eventstore/es-gencert-cli:1.0.1 create-node -ca-certificate /tmp/ca/ca.crt -ca-key /tmp/ca/ca.key -out /tmp/node -ip-addresses 127.0.0.1 -dns-names localhost

chmod -R 0755 "$root"