FROM ubuntu:22.04
RUN apt update && apt install -y software-properties-common && add-apt-repository -y ppa:jwt27/djgpp-toolchain && apt update && apt install -y djgpp
ENV PATH="/usr/i386-pc-msdosdjgpp/local/bin:/usr/i386-pc-msdosdjgpp/bin:/usr/bin:$PATH"
ENV GCC_EXEC_PREFIX="/usr/lib/gcc/"
ENV MANPATH="/usr/i386-pc-msdosdjgpp/local/share/man:/usr/i386-pc-msdosdjgpp/share/man:/usr/share/man:$MANPATH"
ENV INFOPATH="/usr/i386-pc-msdosdjgpp/local/share/info:/usr/i386-pc-msdosdjgpp/share/info:/usr/share/info:$INFOPATH"
ENV PKG_CONFIG_LIBDIR="/usr/i386-pc-msdosdjgpp/local/lib/pkgconfig:/usr/i386-pc-msdosdjgpp/local/share/pkgconfig:/usr/i386-pc-msdosdjgpp/lib/pkgconfig:/usr/i386-pc-msdosdjgpp/share/pkgconfig"
ENV PKG_CONFIG_PATH=""
ENV DJDIR="/usr/i386-pc-msdosdjgpp"
ENV WATT_ROOT="/usr/i386-pc-msdosdjgpp/watt"
