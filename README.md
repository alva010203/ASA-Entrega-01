# ASA-Entrega-01 - Docker: Conceitos e Implementação
---
## 📌 Descrição do Projeto
**Este repositório apresenta a entrega do seminário sobre Docker, realizado para a disciplina de ASA (Administração de Sistemas Abertos) com o professor [@salesfilho](https://github.com/salesfilho). Sendo desenvolvido pelos alunos (@alva010203  
O projeto demonstra, de forma prática:**
- 🐳 **Conceitos fundamentais do Docker**

- 🔗 **Comunicação entre containers**

- 🛠️ **Implementação de serviços distribuídos**


### 🧩 O que está incluido?
✅ **Arquitetura do projeto e diagrama**.  

✅ **3 containers Docker e seus arquivos de configuração**.  
- **DNS** ( )  
- **WEB** ( )   
- **Client**( )
  
✅ **Estrutura** dos serviços implementados (dns,web,cliente).  

✅ **documento da apresentação do projeto**(em PDF) e **vídeo demonstrativo**.  

✅ **Instruções** para execução local .

----
## 🛠️Arquitetura 

**A arquitetura é baseada em três containers Dockers interconectados: um servidor web( ), um serviço de DNS(), e um cliente. Cada componente é isolado e se comunica por meio de uma rede bridge interna, essa divisão garante isolamento,e segurança**

### 📜Diagrama da Arquitetura



---

### Componentes
-lista dos serviços/containers utilizados com uma descrição basica.

| Serviço | Imagem Base     | Função                          |
|---------|------------------|---------------------------------|
| `web`   |  ( Nginx )      | Servidor web executando o site www.seminariodocker.com |
| `Client`   | (Ubuntu ) | Usado para simular um cliente acessando o site.    |
| `dns`   | (ubuntu)    | Serviço DNS para resolver o ip do servidor web.   |

---
## 📁 Estrutura

```
atividade-asa-01/
├── dns/
│ ├── Dockerfile
│ ├── db.asa.br
│ └── named.conf.local
│
├── web/
│ ├── Dockerfile
│ ├── index.html
│ ├── comandos.html
│ ├── dockerfi.html
│ └── style.css
│
├── service.sh
└── README.md
```
---
## 🖥️Apresentação projeto


#  Instruçao execução
