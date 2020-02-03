FROM alpine:latest
ARG scheme=full

#ENV PATH="/opt/texlive/texdir/bin/x86_64-linuxmusl:${PATH}"

COPY compile.sh /

RUN /compile.sh ${scheme}

#ENTRYPOINT [ "gp" ]
