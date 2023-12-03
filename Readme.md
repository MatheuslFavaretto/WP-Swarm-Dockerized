# Projeto WordPress com Docker Compose
<table>
    <tr>
        <th>Diagrama do Projeto</th>
    </tr>
    <tr>
        <td><img src="https://github.com/MatheuslFavaretto/devops-project/assets/116848225/e7601e1a-2d87-4db0-87ee-1e3bfacc7c3a" alt="listar todos os vídeos"></td>
    </tr>
</table>

Este projeto implementa um ambiente Dockerizado para o WordPress, utilizando Docker Compose, de acordo com os requisitos especificados.

## Detalhes do Projeto

- **Container WordPress:** Utilizando a versão mais recente.
- **Agente NewRelic:** Integrado para monitoramento com a ferramenta.
- **WP-CLI:** Incluído no container WordPress.
- **Container Redis:** Implementado para cache.
- **Container mariadb:** Utilizado como banco de dados.

## Requisitos Atendidos

- **Persistência de Dados:** Utilização de volumes para armazenar arquivos e dados do banco.
- **Rede de Comunicação:** Containers estão na mesma rede para comunicação.
- **Timezone:** Configurado conforme o timezone do servidor WordPress (America/Sao_Paulo).
- **Gerenciamento de Log:** Limitado a um tamanho máximo de 10MB por arquivo, com um máximo de 10 arquivos.
- **Limites de Recursos:** Definidos limites de CPU e memória para cada container.

## Como Utilizar

Para usar este projeto, siga estas etapas:

1. Certifique-se de ter o Docker e o Docker Compose instalados.
2. Clone este repositório para o seu ambiente local.
3. Abra o terminal e navegue até o diretório do projeto.
4. Execute o comando `make prod` para iniciar o ambiente.

Isso iniciará os containers conforme configurado no arquivo `docker-compose.yml` e você poderá acessar o WordPress através do navegador usando o endereço local e a porta configurada.

Lembre-se de configurar as variáveis de ambiente necessárias no arquivo `.env` antes de executar o ambiente.

Para mais detalhes sobre configurações específicas ou personalizações, consulte a documentação completa no arquivo `docker-compose.yml`.
