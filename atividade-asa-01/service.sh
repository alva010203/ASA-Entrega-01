#!/bin/env bash

servico=$1
acao=$2

#nome das imagens
img_dns="testedns"
img_web="testeweb"

#verifica se a rede existe se nao existir ela é criada
docker network inspect rede-asa >/dev/null 2>&1 || docker network create rede-asa

case $servico in
  dns)
    if [ "$acao" == "start" ]; then
        docker build -t "$img_dns" ./dns
        docker run --network rede-asa -p 53:53/udp -p 53:53/tcp --name conteinerdns -d $img_dns
    elif [ "$acao" == "stop" ]; then
        docker stop conteinerdns
    fi
    ;;
  web)
    if [ "$acao" == "start" ]; then
        docker build -t "$img_web" ./web
        docker run --network rede-asa -p 5151:80 --name conteinerweb -d $img_web
    elif [ "$acao" == "stop" ]; then
        docker stop conteinerweb 
    fi
    ;;
  *)
    echo "Service desconhecido, tente dns ou web"
    ;;
esac
