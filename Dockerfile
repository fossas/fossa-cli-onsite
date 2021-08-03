FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install git curl unzip sudo

RUN useradd -ms /bin/bash fossa
RUN usermod -aG sudo fossa
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers

USER fossa
WORKDIR /home/fossa

RUN cd /home/fossa
RUN git clone https://github.com/fossas/fossa-cli-onsite
RUN cd /home/fossa/fossa-cli-onsite && rm Dockerfile README.md

RUN curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/fossas/spectrometer/master/install.sh | sudo bash