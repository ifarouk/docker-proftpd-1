FROM ubuntu

MAINTAINER Fabio H. G. Barbosa <fabiohbarbosa@gmail.com>

USER root

RUN apt-get update
RUN apt-get install -y proftpd

ADD proftpd.conf /etc/proftpd/proftpd.conf

RUN mkdir /ftp
RUN chmod 777 /ftp
RUN chown 1000:1000 /ftp

ADD startup.sh /startup.sh

EXPOSE 21
EXPOSE 20

CMD ["sh", "/startup.sh"]
