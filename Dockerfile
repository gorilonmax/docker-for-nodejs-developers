FROM node:6.10

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y tmux
RUN apt-get install -y git

RUN npm i -g pm2
RUN npm i -g raml2html
RUN npm i -g eslint

RUN mkdir /Workspace
RUN touch /etc/dummy

EXPOSE 8000 8001 8002 8080 8081 8082 8083 8084 8085 8086 8087 8088 8089 8090 8091 8092 8093 8094 8095 8096 8096 8097 8098 8099
