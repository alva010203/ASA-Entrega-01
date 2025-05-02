FROM ubuntu:latest

#evita interações em pacotes complexos(aprova de problemas futuros)
#ENV DEBIAN_FRONTEND=noninteractive

#atualiza e instala os pacote necessários
RUN apt update && apt install -y bind9 dnsutils 

COPY named.conf.local /etc/bind/named.conf.local
COPY db.asa.br /etc/bind/db.asa.br

#Expõe as portas padrão do DNS udp para consultas rapidas e tcp para respostas
#grandes como transferencias de zona
EXPOSE 53/udp
EXPOSE 53/tcp


CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
