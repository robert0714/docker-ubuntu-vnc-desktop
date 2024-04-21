# FROM ubuntu:22.04
FROM ubuntu:20.04
MAINTAINER Robert Lee <robert0714@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's#http://archive.ubuntu.com/#http://tw.archive.ubuntu.com/#' /etc/apt/sources.list

RUN apt-get update -y && \
    apt-get install -y  --no-install-recommends --allow-unauthenticated \
    git \
    ca-certificates \
    tigervnc-standalone-server \
    tigervnc-common \ 
    lxde \
    firefox \
    fonts-freefont-ttf \
    fonts-wqy-zenhei  \
    supervisor && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*
    

RUN git clone https://github.com/novnc/noVNC /noVNC && \
    git -C /noVNC checkout -b local 36bfcb0 && \
    echo "<meta http-equiv='refresh' content='0; url=vnc.html?password=password&resize=remote&autoconnect=1'>" > /noVNC/index.html && \
    git clone https://github.com/novnc/websockify /noVNC/utils/websockify && \
    git -C /noVNC/utils/websockify checkout -b local v0.11.0 && \
    rm -rf /noVNC/.git /noVNC/utils/websockify/.git

COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ENV USER root

EXPOSE 6080

RUN mkdir /root/.vnc && \
    echo password | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd && \
    touch /root/.Xauthority && \
    update-alternatives --remove-all vncconfig
    
ENV TZ=Asia/Taipei
CMD ["/usr/bin/supervisord","-n"]
