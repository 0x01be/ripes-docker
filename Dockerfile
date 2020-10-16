FROM 0x01be/ripes:build as build

FROM 0x01be/xpra

COPY --from=build /opt/ripes/ /opt/ripes/

USER root
RUN apk add --no-cache --virtual ripes-runtime-dependencies \
    qt5-qtbase \
    qt5-qtcharts \
    qt5-qtsvg
   
USER xpra

ENV PATH ${PATH}:/opt/ripes/bin/

ENV COMMAND ripes

