#It seems there is no "slim" image that contains everything that is required. Too bad...
FROM ubuntu:latest
LABEL maintainer="rejutka"

ADD https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb /tmp/fahclient.deb

# FIXME: Awful workaround until the DEBs are correctly packaged
RUN dpkg -i /tmp/fahclient.deb || true

#Create XML configuration for FAH
RUN echo "<config> <max-units v=1></config>" > /usr/bin/config.xml

VOLUME ["/var/lib/fahclient", "/etc/fahclient"]
ENTRYPOINT [ "/usr/bin/FAHClient" ]

#Going a different route now
# CMD [ "--fold-anon --finish" ]
