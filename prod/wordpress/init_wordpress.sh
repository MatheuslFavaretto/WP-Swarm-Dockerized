#!/usr/bin/env sh

# Instalação do WordPress.
wp core install \
  --path="/var/www/html" \
  --url="http://localhost:8080" \
  --title="Título do Blog" \
  --admin_user="admin" \
  --admin_password="admin-password" \
  --admin_email="admin@domain.com" \
  --locale=pt_BR

# Atualiza a estrutura de permalinks.
wp option update permalink_structure /%postname%/ --skip-themes

# Instala e ativa o tema Astra.
wp theme install astra --activate

# Remove todos os temas (exceto o tema ativo).
wp theme delete --all --force

# Desinstala todos os plugins.
wp plugin uninstall --all

# Instala e ativa o plugin Redis Object Cache.
wp plugin install redis-cache --activate

# Configura o Redis Object Cache.
wp config set --type=variable redis_host 'redis'
wp config set --type=variable redis_port '6379'
wp config set --type=constant WP_REDIS_HOST 'redis'
wp config set --type=constant WP_REDIS_PORT '6379'
wp config set --type=constant WP_REDIS_SELECTIVE_FLUSH 'true'
wp config set --type=constant WP_CACHE 'true'
wp redis enable

# Verifica o status da conexão do Redis.
wp redis status

# Configurações adicionais do plugin Redis.
wp config set WP_REDIS_HOST "redis"
wp config set WP_REDIS_PORT "6379"
wp config set WP_REDIS_DATABASE "15"

# Define o fuso horário para São Paulo (America/Sao_Paulo).
wp option update timezone_string "America/Sao_Paulo"

# Exibe um relatório com lista de usuários, temas e plugins instalados.
echo -e "\nRELATÓRIO\n"

echo "== Lista de Usuários =="
wp user list
echo ""

echo "== Lista de Temas Instalados =="
wp theme list
echo ""

echo "== Lista de Plugins Instalados =="
wp plugin list
echo ""
