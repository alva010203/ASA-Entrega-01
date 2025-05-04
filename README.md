# ASA-Entrega-01 - Docker: Conceitos e Implementação
---
## 📌 Descrição do Projeto
**Este repositório apresenta a entrega do seminário sobre Docker, realizado para a disciplina de ASA (Administração de Sistemas Abertos) com o professor [@salesfilho](https://github.com/salesfilho).
O projeto demonstra, de forma prática:**
- 🐳 **Conceitos fundamentais do Docker**

- 🔗 **Comunicação entre containers**

- 🛠️ **Implementação de serviços distribuídos**

### 🧩 O que está incluido?
✅ **Arquitetura do projeto e diagrama**.  

✅ **2 containers Docker e seus arquivos de configuração**.  
- **DNS** ( )  
- **WEB** ( )   
✅ **Estrutura** dos serviços implementados (dns,web).  

✅ **documento da apresentação do projeto**(em PDF) e **vídeo demonstrativo**.  

✅ **Instruções** para execução local .

----
## 🛠️Arquitetura 

**A arquitetura usa dois containers Docker: servidor web, serviço de DNS. O DNS resolve domínios em IPs, o servidor web processa requisições HTTP e retorna respostas, e o cliente consulta o DNS para acessar o site hospedado no servidor web por meio da URL www.asa.br . Todos se comunicam por uma rede bridge interna, garantindo isolamento e segurança.**
### 📜Diagrama da Arquitetura



---

### Componentes
-lista dos serviços/containers utilizados com uma descrição basica.

| Serviço | Imagem Base     | Função                          |
|---------|------------------|---------------------------------|
| `web`   |  ( Nginx )      | Servidor web executando o site www.asa.br |
| `dns`   | (ubuntu)    | Serviço DNS para resolver o ip do servidor web.   |

---
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
## 🖥️Apresentação projeto


#  Instruçao execução
