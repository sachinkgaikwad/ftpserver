# README #

###aerport-ftpserver 

##Description :
FTP + HTTP file server for Aerport Reports and Aeradmin filestore. 

## Jenkins Plan 
http://build.aeriscloud.com:8080/job/aerport-ftpserver/

## Deployment : Docker 

## Environment variable

USER : (Provide username)
PASS : (Provide Password)

## Volume : 
Please create local volume to privent FTP file Store dataloss.

## Ports :
Assign any WEB port and keep 21 port external if require. 

## Rancher File 


```
#!yaml

version: '2'
services: 
  ftpserver: 
    image: repo.aeriscloud.com:8888/aerport/ftpserver:22 
    environment:
      USER: webadm
      PASS: webadm
    stdin_open: true
    volumes:
    - /opt/aeris/ftpserver:/opt
    tty: true
    ports:
    - 8095:80/tcp
    - 21:21/tcp
    - 20:20/tcp
    labels:
      io.rancher.container.pull_image: always

```