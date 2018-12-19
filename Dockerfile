FROM debian:latest

RUN apt-get update -y \
	&& apt-get install -y wget \
        libc6:i386 \
        libstdc++6:i386 \
        libglapi-mesa:i386 \
        libgl1-mesa-glx:i386 \
        libxxf86vm1:i386 \
        libxext6:i386 \
        libx11-6:i386 \
        libfreetype6:i386 \
        libgcc1-dbg:i386 \
        libxdamage1:i386 \
        libxfixes3:i386 \
        libx11-xcb1:i386 \
        libxcb-glx0:i386 \
        libxcb-dri2-0:i386 \
        libxcb1:i386 \
        libdrm2:i386 \
        libxdmcp6:i386 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/kag-server

RUN wget http://dl.kag2d.com/kag-linux32-dedicated-release.tar.gz \
    && tar -zxf kagbeta-linux32-dedicated.tar.gz \
    && rm kagbeta-linux32-dedicated.tar.gz \
    && chmod +x kagbeta-linux32-dedicated/dedicatedserver.sh

VOLUME /opt/kag-server/kagbeta-linux32-dedicated/autoconfig.cfg 

EXPOSE 50301/udp

CMD kagbeta-linux32-dedicated/dedicatedserver.sh