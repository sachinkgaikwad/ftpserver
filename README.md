# README #





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
    image: ftpserver
    environment:
      USER: 
      PASS: 
    stdin_open: true
    volumes:
    - /opt:/opt
    tty: true
    ports:
    - 8095:80/tcp
    - 21:21/tcp
    - 20:20/tcp
    labels:
      io.rancher.container.pull_image: always

```
