.PHONY: dev prod help

dev_dir := ./dev
prod_dir := ./prod

dev: ## Inicia serviços e instala o WordPress no ambiente de desenvolvimento
	@echo "Iniciando os serviços no ambiente de desenvolvimento..."
	@(cd $(dev_dir) && docker-compose up -d mysql redis wordpress varnish newrelic)
	@echo "Esperando 10 segundos para garantir que os serviços inicializem corretamente..."
	@sleep 10  # Aumentei para 10 segundos
	@echo "Executando a instalação do WordPress no ambiente de desenvolvimento..."
	@(cd $(dev_dir) && docker-compose run --rm wp-cli sh -c 'sh /usr/local/bin/install-wp')
	@echo "Configuração completa no ambiente de desenvolvimento."

prod: ## Inicia serviços e instala o WordPress no ambiente de produção
	@echo "Iniciando os serviços no ambiente de produção..."
	@(cd $(prod_dir) && docker-compose up --build -d db redis varnish)
	@echo "Esperando 10 segundos para garantir que os serviços inicializem corretamente..."
	@sleep 10  # Aumentei para 10 segundos
	@(cd $(prod_dir) && docker-compose up --build -d wordpress)
	@echo "Executando a instalação do WordPress no ambiente de produção..."
	@(cd $(prod_dir) && docker-compose run --rm wp-cli sh -c 'sh /usr/local/bin/init_wordpress')
	@echo "Configuração completa no ambiente de produção."

help: ## Exibe informações de uso
	@echo "Uso:"
	@echo "  make dev  - Inicia serviços e instala o WordPress no ambiente de desenvolvimento"
	@echo "  make prod - Inicia serviços e instala o WordPress no ambiente de produção"
