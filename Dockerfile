FROM martinussuherman/alpine-tz-ep-code-server

ENV LABEL_MAINTAINER="Martinus Suherman" \
    LABEL_VENDOR="martinussuherman" \
    LABEL_IMAGE_NAME="martinussuherman/alpine-tz-ep-code-server-net-sdk-31" \
    LABEL_URL="https://hub.docker.com/r/martinussuherman/alpine-tz-ep-code-server-net-sdk-31/" \
    LABEL_VCS_URL="https://github.com/martinussuherman/alpine-tz-ep-code-server-net-sdk-31" \
    LABEL_DESCRIPTION="Alpine Linux based image of code-server bundled with .NET Core SDK and some utilities" \
    LABEL_LICENSE="GPL-3.0" \
    # container/su-exec UID \
    EUID=1001 \
    # container/su-exec GID \
    EGID=1001 \
    # additional directories to create + chown (space separated) \
    ECHOWNDIRS= \
    # additional files to create + chown (space separated) \
    ECHOWNFILES= \
    DOTNET_ROOT=/usr/share/dotnet

RUN apk --no-cache --update add \
    icu-libs \
    krb5-libs \
    libintl \
    libssl1.1 \
    libstdc++ \ 
    lttng-ust \
    numactl \
    zlib

WORKDIR /tmp

RUN wget https://download.visualstudio.microsoft.com/download/pr/041277e6-2759-47a0-b990-e15b564c2485/6156fb738728ffe2f226c431739584d5/dotnet-sdk-3.1.300-linux-musl-x64.tar.gz && \
    mkdir dotnet && \
    tar x -C dotnet -zf dotnet-sdk-3.1.300-linux-musl-x64.tar.gz && \
    rm dotnet-sdk-3.1.300-linux-musl-x64.tar.gz && \
    mv dotnet /usr/share && \
    ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet 

#
ARG LABEL_VERSION="latest"
ARG LABEL_BUILD_DATE
ARG LABEL_VCS_REF

# Build-time metadata as defined at http://label-schema.org
LABEL maintainer=$LABEL_MAINTAINER \
      org.label-schema.build-date=$LABEL_BUILD_DATE \
      org.label-schema.description=$LABEL_DESCRIPTION \
      org.label-schema.name=$LABEL_IMAGE_NAME \
      org.label-schema.schema-version="1.0" \
      org.label-schema.url=$LABEL_URL \
      org.label-schema.license=$LABEL_LICENSE \
      org.label-schema.vcs-ref=$LABEL_VCS_REF \
      org.label-schema.vcs-url=$LABEL_VCS_URL \
      org.label-schema.vendor=$LABEL_VENDOR \
      org.label-schema.version=$LABEL_VERSION
