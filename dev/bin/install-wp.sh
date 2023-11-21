#!/usr/bin/env sh

# Install WordPress.
wp core install \
  --path="/var/www/html" \
  --url="http://localhost:${WORDPRESS_PORT}" \
  --title="${WORDPRESS_TITLE}" \
  --admin_user="${WORDPRESS_ADMIN_USER}" \
  --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
  --admin_email="${WORDPRESS_ADMIN_EMAIL}"

# Update permalink structure.
wp option update \
  permalink_structure "${WORDPRESS_PERMALINK_STRUCTURE}" \
  --skip-themes \

# Theme installation
wp theme delete --all --force  # Remove todos os temas
wp theme install "${WORDPRESS_THEME_TO_INSTALL}" --activate  # Instala e ativa um tema

# Plugin installation
wp plugin uninstall --all  # Desinstala todos os plugins
wp plugin install ${WORDPRESS_PLUGINS_TO_INSTALL} --activate  # Instala e ativa plugins

# Configure Redis Object Cache
wp config set --type=variable redis_host 'redis'  # Define o host do Redis
wp config set --type=variable redis_port '6379'   # Define a porta do Redis

# Ativa o cache do Redis para o WordPress
wp config set --type=constant WP_REDIS_HOST 'redis'
wp config set --type=constant WP_REDIS_PORT '6379'
wp config set --type=constant WP_REDIS_SELECTIVE_FLUSH 'true'
wp config set --type=constant WP_CACHE 'true'

# Next, enable the drop-in:
wp redis enable  # Ativa o drop-in do Redis

# Check the connection:
wp redis status  # Verifica o status da conexão do Redis

# Configure the plugin
wp config set WP_REDIS_HOST "redis"
wp config set WP_REDIS_PORT "6379"
wp config set WP_REDIS_DATABASE "15"


echo -e "\nREPORT\n"

# List users
echo "== User List =="
wp user list
echo ""

# Show installed theme
echo "== Theme List =="
wp theme list
echo ""

# Show installed plugins
echo "== Plugin List =="
wp plugin list
echo ""
