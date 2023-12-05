# Projeto WordPress com Docker

![Diagrama do Projeto](https://github.com/MatheuslFavaretto/devops-project/assets/116848225/e7601e1a-2d87-4db0-87ee-1e3bfacc7c3a)

Este projeto tem como objetivo implementar um ambiente Dockerizado para o WordPress, utilizando Docker Compose, de acordo com os requisitos estabelecidos abaixo.

## Detalhes do Projeto

- **Container WordPress:** Utiliza a versão mais recente disponível.
- **Agente NewRelic:** Integrado para fins de monitoramento, utilizando a ferramenta.
- **WP-CLI:** Incluído no container do WordPress para facilitar a administração.
- **Container Redis:** Implementado para funcionalidade de cache.
- **Container mariadb:** Utilizado como banco de dados.

## Requisitos Atendidos

- **Persistência de Dados:** Utilização de volumes para armazenamento de arquivos e dados do banco.
- **Rede de Comunicação:** Todos os containers estão na mesma rede para uma comunicação eficiente.
- **Timezone:** Configurado de acordo com o timezone do servidor do WordPress (America/Sao_Paulo).
- **Gerenciamento de Log:** Limitado a um tamanho máximo de 500MB por arquivo, com um máximo de 5 arquivos.
- **Limites de Recursos:** Definidos limites de CPU e memória para cada container.

## Como Utilizar

Para utilizar este projeto, siga as instruções abaixo:

1. Verifique se possui o Docker e o Docker Compose instalados.
2. Clone este repositório para o seu ambiente local.
3. Navegue até o diretório do projeto no terminal.
4. Antes de executar o ambiente, configure as variáveis de ambiente necessárias no arquivo `.env`.
5. Execute o comando `make prod` para iniciar o ambiente.

Isso iniciará os containers de acordo com a configuração definida no arquivo `docker-compose.yml`. Você poderá acessar o WordPress pelo navegador, utilizando o endereço local e a porta configurada.

Para obter detalhes mais específicos sobre configurações ou personalizações, consulte a documentação completa no arquivo `docker-compose.yml`.

## Estrutura do Projeto

- **Diretório `dev`:** Contém o projeto apenas com Docker Compose.
- **Diretório `prod`:** Projeto organizado com cada diretório tendo seu próprio Dockerfile e um docker-compose que constrói e inicia.
- **Diretório `swarm`:** Projeto com Docker Swarm. O comando `make all` realiza o build e push das imagens para o Docker Hub. Para iniciar, utilize os comandos: `docker swarm init --advertise-addr [seu endereço de IP]` e `docker stack deploy -c docker-swarm.yml app`.

Lembre-se de que cada diretório possui sua própria configuração e propósito, adequando-se a diferentes necessidades e ambientes.

---
*Observação: Verifique se adapta os comandos e configurações conforme necessário para o seu ambiente específico.*
