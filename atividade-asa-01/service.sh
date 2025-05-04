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

case $servico in
  dns)
    case $acao in
      start)
        if  docker ps --format '{{.Names}}'| grep -q "$dns_container" ; then
            echo "O container ja está em execução"
        else
            echo "Iniciando o container $dns_container..."
            docker start $dns_container 2>/dev/null || docker run --network rede-asa -p 53:53/udp -p 53:53/tcp --name $dns_container -d $img_dns
        fi
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
  --help)
    echo "Uso: $0 <serviço> <ação>"
    echo
    echo "Serviços disponíveis:"
    echo "  dns    - Gerencia o serviço de DNS (porta 53)"
    echo "  web    - Gerencia o serviço Web (porta 80)"
    echo
    echo "Ações disponíveis para cada serviço:"
    echo "  start  - Inicia o container"
    echo "  stop   - Para o container"
    echo "  build  - Constrói a imagem Docker a partir do Dockerfile local"
    echo "  rm     - Remove o container"
    echo
    echo "Exemplos:"
    echo "  $0 dns build     # Constrói a imagem do DNS"
    echo "  $0 dns start     # Inicia o container do DNS"
    echo "  $0 web stop      # Para o container Web"
    echo "  $0 web rm        # Remove o container Web"
    exit 0
    ;;
  *)
    echo "Formato inválido tente "--help" para ver as opções disponiveis "
    exit 1
    ;;
esac

