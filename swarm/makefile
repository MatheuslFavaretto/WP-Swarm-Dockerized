# Nome do arquivo docker-compose
COMPOSE_FILE = docker-compose.yml

# Nome do projeto
PROJECT_NAME = app

# Nome de usuário no Docker Hub
DOCKER_USERNAME = matheuslfavaretto

# Comando para construir todas as imagens do docker-compose.yml
build:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) build

# Comando para marcar todas as imagens construídas
tag:
	@for service in $$(docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) config --services); do \
		docker tag $(PROJECT_NAME)_$$service $(DOCKER_USERNAME)/$$service:latest; \
	done

# Comando para fazer login no Docker Hub
login:
	docker login -u $(DOCKER_USERNAME)

# Comando para enviar (push) todas as imagens para o Docker Hub
push:
	@for service in $$(docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) config --services); do \
		docker push $(DOCKER_USERNAME)/$$service:latest; \
	done

# Comando para fazer logout do Docker Hub
logout:
	docker logout

# Comando que executa todas as etapas: build, tag, login, push, logout
all: build tag login push logout
