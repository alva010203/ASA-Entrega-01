#!/bin/env bash

servico=$1
acao=$2

# nome das imagens
img_dns="testedns"
img_web="testeweb"

# containers
dns_container="dns_container"
web_container="web_container"

# verifica se a rede existe; se não existir, ela é criada
docker network inspect rede-asa >/dev/null 2>&1 || docker network create rede-asa

# verifica o número de parâmetros
if ! [ "$#" -eq 2 ]; then
    echo "Número de parâmetros incorreto"
    echo "Uso correto: $0 <serviço> <ação>"
    exit 1
fi

case $servico in
  dns)
    case $acao in
      start)
        echo "Iniciando o container $dns_container..."
        docker start $dns_container 2>/dev/null || docker run --network rede-asa -p 53:53/udp -p 53:53/tcp --name $dns_container -d $img_dns
        ;;
      build)
        echo "Construindo a imagem $img_dns..."
        docker build -t "$img_dns" ./dns
        ;;
      stop)
        echo "Parando o container $dns_container..."
        docker stop $dns_container
        ;;
      rm)
        echo "Removendo o container $dns_container..."
        docker rm $dns_container
        ;;
      *)
        echo "Ação desconhecida para o serviço dns. Use: start, stop, build ou rm."
        exit 1
        ;;
    esac
    ;;
  web)
    case $acao in
      start)
        echo "Iniciando o container $web_container..."
        docker start $web_container 2>/dev/null || docker run --network rede-asa -p 80:80 --name $web_container -d $img_web
        ;;
      build)
        docker build -t "$img_web" ./web
        ;;
      stop)
        docker stop $web_container
        ;;
      rm)
        docker rm $web_container
        ;;
      *)
        echo "Ação desconhecida para o serviço web. Use: start, stop, build ou rm."
        exit 1
        ;;
    esac
    ;;
  *)
    echo "Serviço desconhecido, tente dns ou web"
    ;;
esac

