.PHONY: start install setup help

dev_dir := ./dev

start:
	@echo "Iniciando os serviços..."
	@(cd $(dev_dir) && docker-compose up -d mysql redis wordpress varnish newrelic)
	@echo "Esperando 20 segundos para garantir que os serviços inicializem corretamente..."
	@sleep 10  # Aumentei para 10 segundos

install:
	@echo "Executando a instalação do WordPress..."
	@(cd $(dev_dir) && docker-compose run --rm wp-cli sh -c 'sh /usr/local/bin/install-wp')

setup: start install
	@echo "Configuração completa."

help:
	@echo "Uso:"
	@echo "  make start     - Inicia os serviços necessários"
	@echo "  make install   - Executa a instalação do WordPress"
	@echo "  make setup     - Inicia os serviços e instala o WordPress"
