#!/bin/bash
# mkdir and info
take() {
  mkdir $1 && cd $1
}

proxy_on() {
    echo -n '输入代理ip(default: 127.0.0.1): '
    read ip
    [ -z $ip ] && ip=127.0.0.1

    export http_proxy=http://$ip:7890
    export https_proxy=http://$ip:7890
    export all_proxy=socks5://$ip:7890
    echo -e "\033[32m proxy on $ip:7890\033[0m"
    # print -P "%B%F{green}proxy on $ip:7890"
}

proxy_off() {
    unset http_proxy
    unset https_proxy
    print -P '%B%F{green} proxy off'
}

clash() {
    proxy_on
    ~/.config/clash/clash-linux &
}

cht() {
    cheat $1 | bat -l bash -p
}

echo $ip

