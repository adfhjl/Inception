build:
	docker compose -f srcs/docker-compose.yaml create --remove-orphans

run:
	docker compose -f srcs/docker-compose.yaml up --remove-orphans --build -d

down:
	docker compose -f srcs/docker-compose.yaml down
	docker system prune -af

logs:
	docker compose -f srcs/docker-compose.yaml logs

clear:
	docker system prune -af


.PHONY: build run down logs
