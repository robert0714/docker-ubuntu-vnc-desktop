# Cli
* cli
    ```bash
    docker build -t test .
    docker run --rm  -p 8080:6080 -v /dev/shm:/dev/shm test
    docker run --rm  -p 8080:6080 -v /dev/shm:/dev/shm ghcr.io/robert0714/docker-ubuntu-vnc-desktop:latest
    ```
## Refernce
### docker-novnc
* https://hub.docker.com/r/itsb/docker-novnc
* https://github.com/itsb/docker-novnc.git
* cli
    ```bash
    docker run --rm -d -p 8080:6080 itsb/docker-novnc
    ```
### ubuntu-desktop-lxde-vnc
* cli
    ```bash
    docker run -p 8080:80 -v /dev/shm:/dev/shm ghcr.io/fcwu/docker-ubuntu-vnc-desktop/app:develop
    docker run -p 8080:80 -v /dev/shm:/dev/shm dorowu/ubuntu-desktop-lxde-vnc
    ```
* Browse http://127.0.0.1:8080/
### vnc-browser
See https://github.com/MRColorR/vnc-browser
