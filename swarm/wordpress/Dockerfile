# Use the official WordPress image
FROM wordpress:php8.2-apache

# Install necessary packages (including wget and gnupg)
RUN set -ex; \
    apt-get update && apt-get install -y wget gnupg;

# Instalação do WP-CLI
RUN set -ex; \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    chmod +x wp-cli.phar; \
    mv wp-cli.phar /usr/local/bin/wp

# NewRelic agent
RUN echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list
RUN wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y newrelic-php5
ENV NR_INSTALL_USE_CP_NOT_LN=1
ENV NR_INSTALL_SILENT=1
RUN newrelic-install install
# Ensure to replace ${NEW_RELIC_LICENSE_KEY} and ${NEW_RELIC_APP_NAME} with actual values
RUN sed -i -e "s/\(newrelic.license =\) .*$/\1 \"${NEW_RELIC_LICENSE_KEY}\"/" \
   -e "s/\(newrelic.appname =\) .*$/\1 \"${NEW_RELIC_APP_NAME}\"/" \
   /usr/local/etc/php/conf.d/newrelic.ini

# Expose the default WordPress port (usually 80)
EXPOSE 80

# You can include other necessary configurations for your project here
