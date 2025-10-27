# Nome do container do MySQL no Docker
CONTAINER_NAME=sgqui_mysql
DB_NAME=sgqui_db
DB_USER=root
DB_PASS=root

# Caminho para os arquivos SQL
BACKUP=./mysql/backup.sql
SCHEMA=./mysql/schema.sql
VIEWS=./mysql/views.sql
PROCEDURES=./mysql/procedures.sql
FUNCTIONS=./mysql/functions.sql
SEED=./mysql/seed.sql

# Up backup antigo
backup-db:
	docker exec -i $(CONTAINER_NAME) mysql -u $(DB_USER) -p$(DB_PASS) < $(BACKUP)
# Apaga e recria apenas o schema
reset-schema:
	docker exec -i $(CONTAINER_NAME) mysql -u $(DB_USER) -p$(DB_PASS) < $(SCHEMA)

# Apaga e recria o schema e popula com dados iniciais
reset-db:
	docker exec -i $(CONTAINER_NAME) mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) < $(SCHEMA)
	docker exec -i $(CONTAINER_NAME) mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) < $(VIEWS)
	docker exec -i $(CONTAINER_NAME) mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) < $(PROCEDURES)
	docker exec -i $(CONTAINER_NAME) mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) < $(FUNCTIONS)
	docker exec -i $(CONTAINER_NAME) mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) < $(SEED)

# Executa apenas o seed (dados iniciais)
seed:
	docker exec -i $(CONTAINER_NAME) mysql -u $(DB_USER) -p$(DB_PASS) $(DB_NAME) < $(SEED)

# Construir a imagem e iniciar os containers do Docker
docker-build:
	docker compose up --build -d

# Construir as imagens de produção
docker-build-prod:
	docker compose -f docker-compose.prod.yml up --build -d

# Inicia os containers do Docker
docker-up:
	docker compose up -d

# Para os containers do Docker
docker-down:
	docker compose down

# Reinicia os containers do Docker
docker-restart: 
	down up

# Lista os containers em execução
docker-ps:
	docker compose ps

# Verifica os logs dos containers
docker-logs:
	docker compose logs -f --tail=100

# Verifica os logs de produção
docker-logs-prod:
	docker compose -f docker-compose.prod.yml logs -f --tail=100

# Makefile help
help:
	@echo "Comandos disponíveis:"
	@echo "  backup-db       - Restaura o banco de dados a partir do backup.sql"
	@echo "  reset-schema    - Apaga e recria apenas o schema do banco de dados"
	@echo "  reset-db        - Apaga e recria o schema e popula com dados iniciais"
	@echo "  seed            - Popula o banco de dados com dados iniciais"
	@echo "  docker-up       - Inicia os containers do Docker"
	@echo "  docker-down     - Para os containers do Docker"
	@echo "  docker-restart  - Reinicia os containers do Docker"
	@echo "  docker-ps       - Lista os containers em execução"
	@echo "  docker-logs     - Verifica os logs dos containers"
	@echo "  docker-build    - Constrói a imagem e inicia os containers do Docker"
	@echo "  docker-build-prod - Constrói as imagens de produção"
	@echo "  docker-logs-prod - Verifica os logs de produção"