FROM ubuntu:latest
MAINTAINER  sachinkgaikwad@gmail.com
RUN apt-get -y  update && apt-get -y  upgrade 
RUN apt-get -y install apache2 curl vim

ENV USER ftpuser
ENV PASS changeme

RUN apt-get update && \
    apt-get install -y vsftpd supervisor && \
    mkdir -p /var/run/vsftpd/empty

RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD start.sh /usr/local/bin/start.sh
ADD vsftpd.conf /etc/vsftpd.conf
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
#RUN cd /etc/apache2/mods-enabled/
RUN ln -s /etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled/cgi.load
RUN ln -s /etc/apache2/mods-available/include.load /etc/apache2/mods-enabled/include.load

RUN mkdir /ftp /var/lock/apache2 /var/run/apache2
RUN mkdir /home/webadm 
RUN mkdir -p  /opt/data

RUN chmod -R 777 /opt

VOLUME ["/opt"]

EXPOSE 80
EXPOSE 20 21
EXPOSE 12020 12021 12022 12023 12024 12025

ENTRYPOINT ["/usr/local/bin/start.sh"]

CMD ["/usr/bin/supervisord"]
