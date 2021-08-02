FROM ubuntu:18.04

RUN useradd -ms /bin/bash fossa
USER fossa
WORKDIR /home/fossa

RUN apt-get update && \
    apt-get -y install git

RUN git clone https://github.com/fossas/fossa-cli-onsite /home/fossa
RUN curl -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/fossas/spectrometer/master/install.sh | bash