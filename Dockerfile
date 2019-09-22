FROM bitnami/minideb:latest
MAINTAINER EccoB
RUN apt-get update \
&& apt-get -y install \
ghostscript imagemagick inotify-tools \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /output && mkdir /input
RUN useradd -ms /bin/bash normal
RUN chown normal:normal /output && chown normal:normal /input

USER normal
ADD script /script


CMD /script/check.sh
