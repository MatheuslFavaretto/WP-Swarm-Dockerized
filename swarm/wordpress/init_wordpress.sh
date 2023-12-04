#!/usr/bin/env sh

# Define o caminho do diretório do WordPress
WP_PATH="/var/www/html"

# Download e instalação do WordPress
wp --allow-root core install \
  --path="/var/www/html" \
  --url="http://localhost:8080" \
  --title="Título do Blog" \
  --admin_user="admin" \
  --admin_password="admin-password" \
  --admin_email="admin@domain.com" \
  --locale=pt_BR

# Atualiza a estrutura de permalinks.
wp --allow-root option update permalink_structure /%postname%/ --skip-themes

# Instala e ativa o tema Astra.
wp --allow-root theme install astra --activate

# Remove todos os temas (exceto o tema ativo).
wp --allow-root theme delete --all --force

# Desinstala todos os plugins.
wp --allow-root plugin uninstall --all

# Instala e ativa o plugin Redis Object Cache.
wp --allow-root plugin install redis-cache --activate

# Configura o Redis Object Cache.
wp --allow-root config set --type=variable redis_host 'redis'
wp --allow-root config set --type=variable redis_port '6379'
wp --allow-root config set --type=constant WP_REDIS_HOST 'redis'
wp --allow-root config set --type=constant WP_REDIS_PORT '6379'
wp --allow-root config set --type=constant WP_REDIS_SELECTIVE_FLUSH 'true'
wp --allow-root config set --type=constant WP_CACHE 'true'
wp --allow-root redis enable

# Verifica o status da conexão do Redis.
wp --allow-root redis status

# Configurações adicionais do plugin Redis.
wp --allow-root config set WP_REDIS_HOST "redis"
wp --allow-root config set WP_REDIS_PORT "6379"
wp --allow-root config set WP_REDIS_DATABASE "15"

# Define o fuso horário para São Paulo (America/Sao_Paulo).
wp --allow-root option update timezone_string "America/Sao_Paulo"

# Exibe um relatório com lista de usuários, temas e plugins instalados.
echo -e "\nRELATÓRIO\n"

echo "== Lista de Usuários =="
wp --allow-root user list --path="/var/www/html"
echo ""

echo "== Lista de Temas Instalados =="
wp --allow-root theme list --path="/var/www/html"
echo ""

echo "== Lista de Plugins Instalados =="
wp --allow-root plugin list --path="/var/www/html"
echo ""
