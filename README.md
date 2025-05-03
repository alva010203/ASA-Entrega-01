# ASA-Entrega-01 - Docker: Conceitos e Implementação
---
## 📌 Descrição do Projeto
**Este repositório apresenta a entrega do seminário sobre Docker, realizado para a disciplina de ASA com o professor @salesfilho. O projeto demonstra, de forma prática:**
- 🐳 **Conceitos fundamentais do Docker**

- 🔗 **Comunicação entre containers**

- 🛠️ **Implementação de serviços distribuídos**


### 🧩 O que está incluido?
✅ **Arquitetura do projeto e diagrama**.  

✅ **3 containers Docker e seus arquivos de configuração**.  
- **DNS** ( )  
- **WEB** ( )   
- **Client**( )
  
✅ **Código-fonte** dos serviços implementados (dns,web,cliente).  

✅ **documento da apresentação do projeto**(em PDF) e **vídeo demonstrativo**.  

✅ **Instruções claras** para execução local .

----
## 📂Arquitetura 

**A arquitetura é baseada em três containers Dockers interconectados: um servidor web( ), um serviço de DNS(bind9), e um cliente. Cada componente é isolado e se comunica por meio de uma rede bridge interna, essa divisão garante isolamento,e segurança**

### 📜Diagrama da Arquitetura



---

### Componentes
-lista dos serviços/containers utilizados com uma descrição basica.

| Serviço | Imagem Base     | Função                          |
|---------|------------------|---------------------------------|
| `web`   |  (  )      | Servidor web com o codigo html     |
| `Client`   | ( ) | Usado para           |
| `dns`   | bind9/custom     | Serviço DNS para resolver nome   |

## Comunicação e motivaÇões tecnicas
