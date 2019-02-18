FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y locales \
    nano zsh curl git ssh python3-pip \
    && pip install pip-tools \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ADD zshrc /root/.zshrc

RUN mkdir /host \
    && rm -f /root/.zsh_history \
    && ln -s /host/zsh_history /root/.zsh_history \
    && ln -s /usr/bin/pip3 /usr/bin/pip \
    && ln -s /usr/bin/python3 /usr/bin/python

ENV LANG en_US.utf8

RUN mkdir /app
WORKDIR /app

CMD ["bash"]