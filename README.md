# Pari GP container

Make a Pari-gp image for Docker. The containers are available on docker-hub
- ``pascalmolin/parigp-small`` for a simple pari/gp install
- ``pascalmolin/parigp-full`` with all packages

## Simple usage

To launch an interactive Pari/GP session
```
docker run -it pascalmolin/parigp-small gp
```

If you want to access the files in your current directory
```
docker run -it -w /tmp -v `pwd`:/tmp gp
```

## Build instructions

From the content of this repository
```
docker build -t parigp-small .
```

To build with all packages
```
docker build -t parigp-full --build-arg scheme=full .
```
