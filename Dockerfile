FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y curl \
    python

RUN curl https://experimental.docker.com/ | sh

COPY notary /bin/notary

ADD https://raw.githubusercontent.com/Yubico/yubikey-neo-manager-dpkg/master/resources/linux-fix-ccid-udev /fix_ccid

RUN python fix_ccid

CMD bin/bash
