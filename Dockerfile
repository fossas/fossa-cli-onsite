FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install git

RUN useradd -ms /bin/bash fossa
USER fossa
WORKDIR /home/fossa

RUN cd /home/fossa
RUN git clone https://github.com/fossas/fossa-cli-onsite
RUN curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/fossas/spectrometer/master/install.sh | bash