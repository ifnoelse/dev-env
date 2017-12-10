#!/usr/bin/env bash
function install {
    install_basic_util
    # install_nginx
    # install_docker
    # install_python3
    # install_ansible
}

function install_basic_util {
    apt update
    apt install -y gcc
    apt install -y vim wget net-tools
}

function install_nginx {
    echo '[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1'> /etc/yum.repos.d/nginx.repo
    apt install -y nginx
    nginx
}

function install_docker {
    apt install -y docker
    groupadd docker
    usermod -aG docker ifnoelse
    mkdir -p /etc/docker
    echo '{"registry-mirrors": ["https://d6at4uvr.mirror.aliyuncs.com"]}'> /etc/docker/daemon.json
    systemctl daemon-reload
    systemctl restart docker
}

install