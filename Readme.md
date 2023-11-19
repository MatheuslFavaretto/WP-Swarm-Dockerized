Suba um projeto novo Wordpress utilizando Docker Compose.

* Um container para o Wordpress utilizando versão mais recente.
* O Wordpress deverá contar com um Agent do NewRelic para monitoramento com essa ferramenta
* O container Wordpress DEVE ter a ferramenta wp-cli

* Um conrtainer de cache Redis. Certifique-se que de fato o Wordpress utilize isso pois, ele só o fará se no arquivo wp-config.php houver uma configuração para isso.
* Um container de banco de dados MySQL|MariaDB mais recentes. 
    * MySQL 8 em container deu um pau em nosso ambiente interno, estamos lá usando MariaDB 11.1
* Camada de cache com Varnish para o webserver.

# Requisitos
* O ambiente deverá estar com volume para que os arquivos e o banco de dados possam ser persistir.
* Eles devem estar na mesma rede para comunicação.
* Atende-se ao timezone do container do servidor Wordpress.
* Atente-se ao tamanho máximo de log para um container. Já vi casos de um container gerando mais de 70GB de log e fudendo com o servidor por causa disso.
* Atente-se a quantidade máxima de CPU e memória que um container pode consumir, senão, um ambiente mal configurado derruba um servidor inteiro.

Crie um board no Trello, permite que eu tenha acesso e crie no mínimo um card por tarefa.