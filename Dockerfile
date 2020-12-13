FROM 0x01be/base

ENV REVISION=master
RUN apk add --no-cache --virtual ripes-build-dependencies \
    git \
    build-base \
    cmake \
    qt5-qtbase-dev \
    qt5-qtcharts-dev \
    qt5-qtsvg-dev &&\
    git clone --recursive --branch ${REVISION} https://github.com/mortbopet/Ripes.git /ripes

WORKDIR /ripes/build

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/ripes \
    ..
RUN make

