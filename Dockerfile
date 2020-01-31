FROM alpine:latest
ARG scheme=full

#ENV PATH="/opt/texlive/texdir/bin/x86_64-linuxmusl:${PATH}"

COPY \
  LICENSE \
  README.md \
  compile.sh \
  /

RUN /compile.sh ${scheme}
