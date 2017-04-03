FROM node:6.10

# utils

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y tmux
RUN apt-get install -y git
RUN apt-get install -y less
RUN apt-get install -y tcl

# redis

RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
WORKDIR /redis-stable
RUN make
RUN make install

# npm

RUN npm i -g pm2
RUN npm i -g raml2html
RUN npm i -g eslint

# user

RUN mkdir /Workspace
RUN mkdir /home/developer
RUN useradd \
    -d /home/developer \
    -s /bin/bash \
    -p developer \
    developer

RUN chown -R developer:developer /home/developer

## config

RUN mkdir -p /usr/local/etc/config

WORKDIR /home/developer
USER developer

## prompt

RUN git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
RUN echo "source ~/.bash-git-prompt/gitprompt.sh" > .bashrc

RUN mkdir .ssh

## vim

RUN echo "set compatible" > .vimrc

## git

RUN git config --global user.email "alberto.mendoza@scouting.org"
RUN git config --global user.name "Alberto Mendoza"

## workspace

WORKDIR /Workspace
USER root
# network

EXPOSE 8000 8001 8002 8080 8081 8082 8083 8084 8085 8086 8087 8088 8089 8090 8091 8092 8093 8094 8095 8096 8096 8097 8098 8099
