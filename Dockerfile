FROM alpine

RUN apk add --no-cache --virtual ripes-build-dependencies \
    git \
    build-base \
    cmake \
    qt5-qtbase-dev \
    qt5-qtcharts-dev
   

ENV RIPES_REVISION master
RUN git clone --depth 1 --branch ${RIPES_REVISION} git clone --recursive https://github.com/mortbopet/Ripes.git /ripes

WORKDIR /ripes/build

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/ripes \
    ..
RUN make
RUN make install

