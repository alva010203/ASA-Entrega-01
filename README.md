# ASA-Entrega-01 - Docker: Conceitos e Implementação
---

## 📌 Descrição do Projeto  ![Status](https://img.shields.io/badge/Status-Funcionando-green)
**Este repositório apresenta a entrega do seminário sobre Docker, realizado para a disciplina de ASA (Administração de Sistemas Abertos) com o professor [@salesfilho](https://github.com/salesfilho).
O projeto demonstra, de forma prática:**
- 🐳 **Conceitos fundamentais do Docker**

- 🔗 **Comunicação entre containers**

- 🛠️ **Implementação de serviços distribuídos**

### 🧩 O que está incluido?

✅ **[Arquitetura](#Arquitetura) do projeto e diagrama.**  

✅ **2 containers Docker e seus arquivos de configuração**.  
- **[dns](./atividade-asa-01/dns/)** 
- **[web](./atividade-asa-01/web/)**  

✅ **[Estrutura](#Estrutura) dos serviços implementados (dns,web).**  

✅ **[Apresentação](#Apresentação) do projeto e vídeo demonstrativo.**  

✅ **[Instruções](#Instruções) para execução local.** 

✅ **[Contribuidores](#Contribuidores) do projeto.**

----
<a name="Arquitetura"></a>
## 🛠️Arquitetura 

**A arquitetura utiliza dois containers Docker: servidor web e um serviço de DNS. O DNS resolve domínios em IPs, o servidor web processa requisições HTTP e retorna respostas, e o cliente consulta o DNS para acessar o site hospedado no servidor web por meio da URL www.asa.br . Todos se comunicam por uma rede bridge interna, garantindo isolamento e segurança.**
### 📜Diagrama da Arquitetura
![Image](https://github.com/user-attachments/assets/2e29c5b4-7a29-4ef5-859c-5fce92502147)

### Componentes
**lista dos serviços/containers utilizados com uma descrição basica**.

| Serviço | Imagem Base     | Função                          |
|---------|------------------|---------------------------------|
| `web`   |  ( Nginx )      | Servidor web que executa o site www.asa.br |
| `dns`   | (ubuntu)    | Serviço DNS para resolver o ip do servidor web.   |

---
<a name="Estrutura"></a>
## 📁 Estrutura

```
atividade-asa-01/               # Raiz do projeto da atividade ASA‑01
├── dns/                       # Container DNS (BIND9)
│   ├── Dockerfile            #  define a imagem Docker do servidor DNS
│   ├── db.asa.br             #  arquivo de zona direta (resolução de “asa.br”)
│   └── named.conf.local      #  configurações locais de zona (inclui db.asa.br)
│
├── web/                       # Container Web (servidor HTTP)
│   ├── Dockerfile            #  define a imagem Docker do servidor Web
│   ├── index.html            #  página inicial pública
│   ├── comandos.html         #  doc explicando comandos usados no Docker
│   ├── dockerfi.html         #  (ex.: guia de uso do Dockerfile em HTML)
│   └── style.css             # → estilos visuais das páginas web
│
├── service.sh                 # → script de boot dos containers
└── README.md                  # → documentação geral do projeto e instruções
```
---

<a name="Apresentação"></a>
## 🖥️Apresentação projeto

### VIDEO DE EXECUÇÃO

https://drive.google.com/file/d/1HQL-vfYCLE38QZbGrWYz71LG8-QGZAtq/view?usp=sharing

### Apresentação ppt
https://docs.google.com/presentation/d/1hekmFoOlxINe768FG1csV4oggJ7k6p_c/edit?usp=sharing&ouid=100223105055311345713&rtpof=true&sd=true
---

<a name="Instruções"></a>
## 🚀 Instruções para Execução Local

### Pré requisitos
-  **Instalado docker desktop ou docker engine**
-  **Instalar o github caso vá usar o git clone**
### Execução
- **git clone https://github.com/alva010203/ASA-Entrega-01.git**
- **cd ASA-Entrega-01**
- **./service.sh dns build**    #constrói a imagem do DNS
- **./service.sh dns build**    #constrói a imagem do serviço web
- **./service.sh dns start**    #inicia o container DNS
- **./service.sh web start.**   #inicia o container WEB

---

<a name="Contribuidores"></a>
## 🤝Contribuidores
 
-[@salva010203](https://github.com/alva010203) - **Álvaro Augusto Pinheiro** 

-[Jaiir0](https://github.com/Jaiir0) - **Jairo Bezerra de Araujo**

-[yanmaia](https://github.com/yanmaia) - **Yan Ferreira Maia**
