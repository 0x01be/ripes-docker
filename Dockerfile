FROM 0x01be/ripes:build as build

FROM 0x01be/xpra

COPY --from=build /ripes/build/Ripes /opt/ripes/bin/

USER root
RUN apk add --no-cache --virtual ripes-runtime-dependencies \
    qt5-qtbase \
    qt5-qtcharts \
    qt5-qtsvg \
    mesa-dri-swrast
   
USER xpra

ENV PATH ${PATH}:/opt/ripes/bin/

ENV COMMAND Ripes

