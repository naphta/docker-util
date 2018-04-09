FROM ubuntu:latest
LABEL maintainer="Jake Hill <jake@naphta.uk>"

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    build-essential \
    dnsutils \
    tcptraceroute \
    vim \
    git \
    wget \
    curl \
    zsh \
    httping \
    netcat-openbsd \
    fping \
    python3 \
    python3-dev \
    python3-setuptools \
    python3-pip && \
  apt-get autoclean -y && \
  apt-get autoremove -y

COPY .zshrc /root/.zshrc
COPY .vim /root/.vim
COPY .vimrc /root/.vimrc

RUN \
  pip3 install pip --upgrade && \
  pip3 install \
    httpie \
    requests \
    ipython && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)" && \
  zsh -c "source $HOME/.zshrc && zplugin update --all" && \
  zsh -c "source $HOME/.zshrc && zplugin compile --all" && \
  zsh -c "source $HOME/.zshrc && compinit"

ENTRYPOINT ["/usr/bin/zsh"]