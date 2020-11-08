ARG GO_VERSION=1.15
FROM golang:${GO_VERSION}-alpine

RUN apk add mingw-w64-binutils &&\
    apk add mingw-w64-winpthreads && \
    apk add mingw-w64-headers && \
    apk add mingw-w64-crt && \
    apk add mingw-w64-gcc && \
    apk add make

RUN adduser -H -D -u 1000 go
USER go

ENV CGO_ENABLED=1 \
    CXX_FOR_TARGET=x86_64-w64-mingw32-g++ \
    CC_FOR_TARGET=x86_64-w64-mingw32-gcc \
    CC=x86_64-w64-mingw32-gcc \
    GOOS=windows

WORKDIR $GOPATH/src
ENTRYPOINT ["go"]
