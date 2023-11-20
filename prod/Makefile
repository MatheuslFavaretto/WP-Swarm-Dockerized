.PHONY: start install setup help

# Inicia os serviços (containers) necessários
start:
	@echo "Iniciando os serviços..."
	@docker-compose up -d mysql redis wordpress varnish newrelic
	@echo "Esperando 20 segundos para garantir que os serviços inicializem corretamente..."
	@sleep 20  # Aguarda 20 segundos após iniciar os serviços

# Executa a instalação do WordPress usando o WP-CLI
install:
	@echo "Executando a instalação do WordPress..."
	@docker-compose run --rm wp-cli sh -c 'sh /usr/local/bin/install-wp'

# Configuração completa: inicia os serviços e instala o WordPress
setup: start install
	@echo "Configuração completa."

# Mensagem de ajuda para utilização do Makefile
help:
	@echo "Uso:"
	@echo "  make start     - Inicia os serviços necessários"
	@echo "  make install   - Executa a instalação do WordPress"
	@echo "  make setup     - Inicia os serviços e instala o WordPress"
