FROM ubuntu:22.04

ARG BUILD_GCC_REPO_URL=https://github.com/jwt27/build-gcc.git
ARG BUILD_GCC_REPO_SHA1=66720ae746a237c1455c7ab7153c03573ca2aa13
ARG TARGET

WORKDIR /build

RUN apt update \
    && apt install -y bison flex curl gcc g++ make texinfo zlib1g-dev tar bzip2 gzip xz-utils unzip python2-dev python3-dev m4 dos2unix git nasm \
    && git clone --depth=1 "$BUILD_GCC_REPO_URL"  \
    && cd "$(basename "$BUILD_GCC_REPO_URL" .git)" \
    && git fetch --depth=1 origin $BUILD_GCC_REPO_SHA1 \
    && git checkout $BUILD_GCC_REPO_SHA1 \
    && ./build-djgpp.sh --batch --prefix=/usr/local --target=$TARGET all \
    && cd .. \
    && rm -rf "$(basename "$BUILD_GCC_REPO_URL" .git)"

ENV PATH="/usr/local/$TARGET/local/bin:/usr/local/$TARGET/bin:/usr/local/bin:$PATH"
ENV GCC_EXEC_PREFIX="/usr/local/lib/gcc/"
ENV MANPATH="/usr/local/$TARGET/local/share/man:/usr/local/$TARGET/share/man:/usr/local/share/man:$MANPATH"
ENV INFOPATH="/usr/local/$TARGET/local/share/info:/usr/local/$TARGET/share/info:/usr/local/share/info:$INFOPATH"
ENV PKG_CONFIG_LIBDIR="/usr/local/$TARGET/local/lib/pkgconfig:/usr/local/$TARGET/local/share/pkgconfig:/usr/local/$TARGET/lib/pkgconfig:/usr/local/$TARGET/share/pkgconfig"
ENV PKG_CONFIG_PATH=""
ENV DJDIR="/usr/local/$TARGET"
ENV WATT_ROOT="/usr/local/$TARGET/watt"