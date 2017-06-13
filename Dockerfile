FROM ubuntu:17.04

# utils

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y tmux
RUN apt-get install -y git
RUN apt-get install -y less
RUN apt-get install -y tcl
RUN apt-get install -y netstat-nat
RUN apt-get install -y net-tools

# redis

RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
WORKDIR /redis-stable
RUN make
RUN make install

# config

RUN mkdir -p /usr/local/etc/config
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# node

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g yarn
RUN npm i -g pm2
RUN npm i -g raml2html
RUN npm i -g eslint

RUN node -v
RUN npm -v

# python deps

RUN apt-get install -y make build-essential zlib1g-dev libbz2-dev libreadline-dev
RUN apt-get update
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN apt-get install -y libssl-dev

# user

RUN mkdir /Workspace
RUN useradd -ms /bin/bash ubuntu

WORKDIR /home/ubuntu
USER ubuntu
RUN touch .bash_profile

## pyenv

RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc

## prompt

RUN git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
RUN echo "source ~/.bash-git-prompt/gitprompt.sh" >> .bashrc
RUN echo "source ~/.bash_profile" >> .bashrc

RUN mkdir .ssh

## vim

RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

## tmux

RUN git clone --recursive https://github.com/tony/tmux-config.git ~/.tmux
RUN ln -s ~/.tmux/.tmux.conf ~/.tmux.conf

## python 2.7.x

RUN ~/.pyenv/bin/pyenv install 2.7.8
RUN ~/.pyenv/bin/pyenv global 2.7.8

## git

RUN git config --global user.email "alberto.mendoza@scouting.org"
RUN git config --global user.name "Alberto Mendoza"

## workspace

WORKDIR /Workspace
ENV LANG en_US.utf8

# network

EXPOSE 8000 8001 8002 8080 8081 8082 8083 8084 8085 8086 8087 8088 8089 8090 8091 8092 8093 8094 8095 8096 8096 8097 8098 8099
