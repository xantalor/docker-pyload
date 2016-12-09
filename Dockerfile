FROM ubuntu
MAINTAINER Xantalor "xantalor@gmail.com"

### Install Applications DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get clean
RUN apt-get install -y python-crypto python-pycurl tesseract-ocr git openssh-server supervisor python-beaker python-imaging gocr python-django python-openssl python-pyxmpp rhino
RUN mkdir -p /var/log/supervisor

### Checkout pyload sources
RUN git clone https://github.com/pyload/pyload.git /pyload

### Make Download and Config Dir
RUN mkdir /pyload/config /pyload/downloads


### Add PyLoad Config Dir
ADD pyload_config /pyload/config

### Clean
RUN apt-get -y upgrade
RUN apt-get -y autoclean
RUN apt-get -y clean
RUN apt-get -y autoremove

### Configure Supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

### Volume
VOLUME ["/pyload/downloads", "/pyload/config"]

### Expose ports
EXPOSE 8000 7227

### Start Supervisor
CMD ["/usr/bin/supervisord","-n"]
