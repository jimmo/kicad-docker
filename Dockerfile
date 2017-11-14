FROM ubuntu:rolling

MAINTAINER jim.mussared@gmail.com

# Update the Ubuntu image
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y software-properties-common

# Add kicad nightly PPA
RUN \
  add-apt-repository --yes ppa:js-reynaud/ppa-kicad && \
  apt-get update

# Install useful things
RUN \
  apt-get install -y curl git sed && \
  apt-get install -y kicad kicad-library kicad-doc-en kicad-demo

# Add the kicad user
RUN adduser --disabled-password --gecos "" kicad
USER kicad

# Configuration and start up
VOLUME ["/home/kicad", "/home/kicad/project"]
WORKDIR /home/kicad/
ENTRYPOINT ["kicad"]
