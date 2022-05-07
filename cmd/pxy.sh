#!/usr/bin/zsh
# hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
hostip="192.168.1.40"
protocol='http'       # 这里可以换成其他协议
port=10809            # 这里可以换成其他端口号

PROXY_HTTP="${protocol}://${hostip}:${port}"

set_proxy(){
    export http_proxy="${PROXY_HTTP}"
    export HTTP_PROXY="${PROXY_HTTP}"
    export https_proxy="${PROXY_HTTP}"
    export HTTPS_proxy="${PROXY_HTTP}"

    git config --global http.proxy ${PROXY_HTTP}
    git config --global https.proxy ${PROXY_HTTP}

    # 使用 proxychains 的话，取消下面这行的注释
    # sudo sed /etc/proxychains.conf -i -e "s/^socks.*$/${protocol}:\/\/${hostip}:${port}/"
}

unset_proxy(){
    unset http_proxy
    unset HTTP_PROXY
    unset https_proxy
    unset HTTPS_PROXY

    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

if [ "$1" = "set" ]
then
    set_proxy
elif [ "$1" = "unset" ]
then
    unset_proxy
else
    echo "Unsupported arguments."
fi

