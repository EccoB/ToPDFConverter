FROM bitnami/minideb:latest
MAINTAINER EccoB
RUN apt-get update \
&& apt-get -y install \
ghostscript imagemagick inotify-tools \
tesseract-ocr tesseract-ocr-all \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /output && mkdir /input
RUN useradd -ms /bin/bash normal
RUN chown normal:normal /output && chown normal:normal /input
RUN chmod a+rwx /output && chmod a+rwx /input

USER normal
ADD script /script


CMD /script/check.sh
