all:
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

