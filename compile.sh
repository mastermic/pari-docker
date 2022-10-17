set -e
scheme="$1" #
VERSION="$(cat VERSION)"
MD5="$(cat MD5)"
TAR="pari-$VERSION.tar.gz"
URL="https://pari.math.u-bordeaux.fr/pub/pari/unix/$TAR"

echo "==> Build Pari/GP $VERSION"

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

#echo "$MD5" | md5sum -c - 
mkdir -p pari
tar --strip-components 1 -zxf "$TAR" -C pari

cd pari

# Install additional packages for full scheme
if [ "$scheme" == "full" ]; then
    echo "==> Get additional packages"
    wget -nv https://pari.math.u-bordeaux.fr/pub/pari/packages/seadata.tgz
    tar xzf seadata.tgz
    wget -nv https://pari.math.u-bordeaux.fr/pub/pari/packages/galpol.tgz
    tar xzf galpol.tgz
    wget -nv https://pari.math.u-bordeaux.fr/pub/pari/packages/galdata.tgz
    tar xzf galdata.tgz
    wget -nv https://pari.math.u-bordeaux.fr/pub/pari/packages/elldata.tgz
    tar xzf elldata.tgz
fi
echo "==> Compile Pari/GP"
./Configure
make -j gp
make install
echo "==> Done"

echo "==> Clean up"
cd /tmp
rm -rf pari
rm $TAR
