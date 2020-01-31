#!/bin/bash

set -e

scheme="$1"
VERSION="2.11.2"
TAR="pari-$VERSION.tar.gz"
URL="https://pari.math.u-bordeaux.fr/pub/pari/unix/$TAR"
MD5="6afe748a472c33ae8787a5034d7742a9"

echo "==> Install system packages"
apk --no-cache add build-base gmp-dev readline-dev tar wget
#gnupg

echo "==> Download sources"
mkdir -p /tmp
cd /tmp
wget -nv "$URL"
#wget -nv "$URL.asc"
#gpg --import /texlive_pgp_keys.asc
#gpg --verify ./install-tl-unx.tar.gz.sha512.asc

md5sum -c <<< "$MD5"
tar --strip-components 1 -zxf "$FILE" -C pari

echo "==> Compile Pari/GP"
cd pari
./Configure
make gp
make install

echo "==> Done"

# Install additional packages for non full scheme
if [ "$scheme" != "full" ]; then
    echo "NIY"
fi

echo "==> Clean up"
