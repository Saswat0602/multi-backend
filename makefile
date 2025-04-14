# Project Makefile for multi-backend setup

PROJECT=multibackend

# Docker Compose Commands
up:
	docker compose -p $(PROJECT) up --build

down:
	docker compose -p $(PROJECT) down

restart: down up

logs:
	docker compose -p $(PROJECT) logs -f

# Container Shell Access
shell-node:
	docker compose -p $(PROJECT) exec node sh

shell-go:
	docker compose -p $(PROJECT) exec golang sh

shell-fastapi:
	docker compose -p $(PROJECT) exec fastapi sh

shell-db:
	docker compose -p $(PROJECT) exec postgres sh

# Prisma (if using Prisma in Node service)
migrate:
	docker compose -p $(PROJECT) exec node npx prisma migrate dev --name init

generate:
	docker compose -p $(PROJECT) exec node npx prisma generate

studio:
	docker compose -p $(PROJECT) exec node npx prisma studio

seed:
	docker compose -p $(PROJECT) exec node npx prisma db seed
