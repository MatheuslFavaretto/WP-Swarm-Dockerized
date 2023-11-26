.PHONY: start install setup help


start:
	@echo "Iniciando os serviços..."
	@docker-compose up --build -d db redis varnish
	@echo "Esperando 20 segundos para garantir que os serviços inicializem corretamente..."
	@sleep 10  # Aumentei para 10 segundos
	@docker-compose up --build -d wordpress

install:
	@echo "Executando a instalação do WordPress..."
	@docker-compose run --rm wp-cli sh -c 'sh /usr/local/bin/init_wordpress'

setup: start install
	@echo "Configuração completa."