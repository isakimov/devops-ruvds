FROM ubuntu:20.04
MAINTAINER ivan akimov <mfkakimov.ivan@mail.ru>
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get upgrade -y && apt install nginx -y
WORKDIR /home/DevOps-Info
COPY ./sours_code /usr/share/nginx/html/
CMD nginx -D
EXPOSE 82
