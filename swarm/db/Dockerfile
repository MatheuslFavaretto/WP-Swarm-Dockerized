# Use a imagem oficial do MariaDB na versão 10.4
FROM mariadb:11.1

# Copie o arquivo de inicialização para a pasta de inicialização do MariaDB
COPY init.sql /docker-entrypoint-initdb.d/

# Defina as variáveis de ambiente
ENV MYSQL_ROOT_PASSWORD=secretpassword
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpressuser
ENV MYSQL_PASSWORD=secretpassword

# Exponha a porta padrão do MySQL (3306)
EXPOSE 3306
