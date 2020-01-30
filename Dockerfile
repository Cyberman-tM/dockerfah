FROM ubuntu:latest
LABEL maintainer="rejutka"

ADD https://download.foldingathome.org/releases/public/release/fahclient/ubuntu-10.10-64bit/v7.1/fahclient_7.1.52_amd64.deb /tmp/fahclient.deb

RUN apt-get update
RUN apt-get -y install libexpat1-dev
RUN apt-get install libssl0.9.8
# FIXME: Awful workaround until the DEBs are correctly packaged
RUN dpkg -i /tmp/fahclient.deb || true

VOLUME ["/var/lib/fahclient", "/etc/fahclient"]
ENTRYPOINT [ "/usr/bin/FAHClient" ]
CMD [ "--fold-anon --oneunit" ]
